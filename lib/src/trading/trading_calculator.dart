import 'fixed_decimal.dart';
import 'trading_rules.dart';

enum LiquidityRole { maker, taker }

final class Position {
  Position({required this.quantity, required this.totalCostBasis}) {
    final invalidEmptyPosition = quantity.isZero && !totalCostBasis.isZero;
    final invalidHeldPosition =
        quantity > FixedDecimal.zero && totalCostBasis <= FixedDecimal.zero;
    if (quantity < FixedDecimal.zero ||
        totalCostBasis < FixedDecimal.zero ||
        invalidEmptyPosition ||
        invalidHeldPosition) {
      throw const TradeValidationException(TradeValidationCode.invalidPosition);
    }
  }

  factory Position.empty() =>
      Position(quantity: FixedDecimal.zero, totalCostBasis: FixedDecimal.zero);

  final FixedDecimal quantity;
  final FixedDecimal totalCostBasis;

  FixedDecimal get averageAcquisitionPrice =>
      quantity.isZero ? FixedDecimal.zero : totalCostBasis / quantity;
}

final class BuyCalculation {
  const BuyCalculation({
    required this.grossAmount,
    required this.fee,
    required this.totalDebit,
    required this.position,
  });

  final FixedDecimal grossAmount;
  final FixedDecimal fee;
  final FixedDecimal totalDebit;
  final Position position;
}

final class SellCalculation {
  const SellCalculation({
    required this.grossAmount,
    required this.fee,
    required this.netProceeds,
    required this.allocatedCostBasis,
    required this.realizedProfitLoss,
    required this.position,
  });

  final FixedDecimal grossAmount;
  final FixedDecimal fee;
  final FixedDecimal netProceeds;
  final FixedDecimal allocatedCostBasis;
  final FixedDecimal realizedProfitLoss;
  final Position position;
}

final class UnrealizedCalculation {
  const UnrealizedCalculation({
    required this.valuation,
    required this.profitLoss,
    required this.rate,
  });

  final FixedDecimal valuation;
  final FixedDecimal profitLoss;
  final FixedDecimal rate;
}

final class TradingCalculator {
  const TradingCalculator();

  BuyCalculation executeMarketBuy({
    required TradingRules rules,
    required FixedDecimal askPrice,
    required FixedDecimal quantity,
    required FixedDecimal availableJpy,
    Position? currentPosition,
  }) => _buy(
    rules: rules,
    price: askPrice,
    quantity: quantity,
    availableJpy: availableJpy,
    currentPosition: currentPosition ?? Position.empty(),
    role: LiquidityRole.taker,
  );

  BuyCalculation executeFilledLimitBuy({
    required TradingRules rules,
    required FixedDecimal limitPrice,
    required FixedDecimal quantity,
    required FixedDecimal availableJpy,
    Position? currentPosition,
  }) => _buy(
    rules: rules,
    price: limitPrice,
    quantity: quantity,
    availableJpy: availableJpy,
    currentPosition: currentPosition ?? Position.empty(),
    role: LiquidityRole.maker,
  );

  SellCalculation executeMarketSell({
    required TradingRules rules,
    required FixedDecimal bidPrice,
    required FixedDecimal quantity,
    required Position currentPosition,
  }) => _sell(
    rules: rules,
    price: bidPrice,
    quantity: quantity,
    currentPosition: currentPosition,
    role: LiquidityRole.taker,
  );

  SellCalculation executeFilledLimitSell({
    required TradingRules rules,
    required FixedDecimal limitPrice,
    required FixedDecimal quantity,
    required Position currentPosition,
  }) => _sell(
    rules: rules,
    price: limitPrice,
    quantity: quantity,
    currentPosition: currentPosition,
    role: LiquidityRole.maker,
  );

  /// 지정가 매수는 Maker 체결을 예상하더라도 Taker 수수료까지 예약한다.
  FixedDecimal reserveLimitBuy({
    required TradingRules rules,
    required FixedDecimal limitPrice,
    required FixedDecimal quantity,
    required FixedDecimal availableJpy,
  }) {
    rules.validate(price: limitPrice, quantity: quantity);
    final grossAmount = limitPrice * quantity;
    final reserved = grossAmount + (grossAmount * rules.takerFeeRate);
    if (availableJpy < reserved) {
      throw const TradeValidationException(TradeValidationCode.insufficientJpy);
    }
    return reserved;
  }

  FixedDecimal reserveLimitSell({
    required TradingRules rules,
    required FixedDecimal limitPrice,
    required FixedDecimal quantity,
    required FixedDecimal availableQuantity,
  }) {
    rules.validate(price: limitPrice, quantity: quantity);
    if (availableQuantity < quantity) {
      throw const TradeValidationException(
        TradeValidationCode.insufficientAsset,
      );
    }
    return quantity;
  }

  UnrealizedCalculation calculateUnrealized({
    required Position position,
    required FixedDecimal bidPrice,
  }) {
    if (position.quantity.isZero || bidPrice <= FixedDecimal.zero) {
      throw const TradeValidationException(TradeValidationCode.invalidPosition);
    }
    final valuation = bidPrice * position.quantity;
    final profitLoss = valuation - position.totalCostBasis;
    return UnrealizedCalculation(
      valuation: valuation,
      profitLoss: profitLoss,
      rate: profitLoss / position.totalCostBasis,
    );
  }

  BuyCalculation _buy({
    required TradingRules rules,
    required FixedDecimal price,
    required FixedDecimal quantity,
    required FixedDecimal availableJpy,
    required Position currentPosition,
    required LiquidityRole role,
  }) {
    rules.validate(price: price, quantity: quantity);
    final grossAmount = price * quantity;
    final fee = _fee(grossAmount, rules, role);
    final totalDebit = grossAmount + fee;
    if (availableJpy < totalDebit) {
      throw const TradeValidationException(TradeValidationCode.insufficientJpy);
    }

    return BuyCalculation(
      grossAmount: grossAmount,
      fee: fee,
      totalDebit: totalDebit,
      position: Position(
        quantity: currentPosition.quantity + quantity,
        totalCostBasis: currentPosition.totalCostBasis + totalDebit,
      ),
    );
  }

  SellCalculation _sell({
    required TradingRules rules,
    required FixedDecimal price,
    required FixedDecimal quantity,
    required Position currentPosition,
    required LiquidityRole role,
  }) {
    rules.validate(price: price, quantity: quantity);
    if (currentPosition.quantity < quantity) {
      throw const TradeValidationException(
        TradeValidationCode.insufficientAsset,
      );
    }

    final grossAmount = price * quantity;
    final fee = _fee(grossAmount, rules, role);
    final netProceeds = grossAmount - fee;
    final sellingAll = currentPosition.quantity == quantity;
    final allocatedCostBasis = sellingAll
        ? currentPosition.totalCostBasis
        : currentPosition.totalCostBasis.proportional(
            quantity,
            currentPosition.quantity,
          );
    final remainingQuantity = currentPosition.quantity - quantity;
    final remainingCostBasis = sellingAll
        ? FixedDecimal.zero
        : currentPosition.totalCostBasis - allocatedCostBasis;

    return SellCalculation(
      grossAmount: grossAmount,
      fee: fee,
      netProceeds: netProceeds,
      allocatedCostBasis: allocatedCostBasis,
      realizedProfitLoss: netProceeds - allocatedCostBasis,
      position: Position(
        quantity: remainingQuantity,
        totalCostBasis: remainingCostBasis,
      ),
    );
  }

  FixedDecimal _fee(
    FixedDecimal grossAmount,
    TradingRules rules,
    LiquidityRole role,
  ) =>
      grossAmount *
      switch (role) {
        LiquidityRole.maker => rules.makerFeeRate,
        LiquidityRole.taker => rules.takerFeeRate,
      };
}

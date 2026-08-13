import 'fixed_decimal.dart';

enum AssetSymbol { btc, eth, xrp, sol, doge }

extension AssetSymbolCode on AssetSymbol {
  String get code => name.toUpperCase();
}

/// 시장 데이터 공급자의 `/symbols` 응답으로 생성하는 거래 규칙이다.
///
/// 수수료와 주문 단위는 변경될 수 있으므로 영구 상수로 두지 않는다.
final class TradingRules {
  TradingRules({
    required this.symbol,
    required this.minimumOrderSize,
    required this.maximumOrderSize,
    required this.quantityStep,
    required this.priceTick,
    required this.takerFeeRate,
    required this.makerFeeRate,
  }) {
    final invalidOrderRange =
        minimumOrderSize <= FixedDecimal.zero ||
        maximumOrderSize < minimumOrderSize;
    final invalidUnit =
        quantityStep <= FixedDecimal.zero || priceTick <= FixedDecimal.zero;
    final invalidOrderUnit =
        !minimumOrderSize.isMultipleOf(quantityStep) ||
        !maximumOrderSize.isMultipleOf(quantityStep);
    final invalidFee =
        takerFeeRate < FixedDecimal.zero ||
        takerFeeRate >= FixedDecimal.one ||
        makerFeeRate <= -FixedDecimal.one ||
        makerFeeRate >= FixedDecimal.one;
    if (invalidOrderRange || invalidUnit || invalidOrderUnit || invalidFee) {
      throw ArgumentError('유효하지 않은 거래 규칙입니다.');
    }
  }

  factory TradingRules.fromDecimalStrings({
    required AssetSymbol symbol,
    required String minimumOrderSize,
    required String maximumOrderSize,
    required String quantityStep,
    required String priceTick,
    required String takerFeeRate,
    required String makerFeeRate,
  }) => TradingRules(
    symbol: symbol,
    minimumOrderSize: FixedDecimal.parse(minimumOrderSize),
    maximumOrderSize: FixedDecimal.parse(maximumOrderSize),
    quantityStep: FixedDecimal.parse(quantityStep),
    priceTick: FixedDecimal.parse(priceTick),
    takerFeeRate: FixedDecimal.parse(takerFeeRate),
    makerFeeRate: FixedDecimal.parse(makerFeeRate),
  );

  final AssetSymbol symbol;
  final FixedDecimal minimumOrderSize;
  final FixedDecimal maximumOrderSize;
  final FixedDecimal quantityStep;
  final FixedDecimal priceTick;
  final FixedDecimal takerFeeRate;
  final FixedDecimal makerFeeRate;

  void validate({required FixedDecimal price, required FixedDecimal quantity}) {
    if (price <= FixedDecimal.zero) {
      throw const TradeValidationException(TradeValidationCode.invalidPrice);
    }
    if (quantity <= FixedDecimal.zero) {
      throw const TradeValidationException(TradeValidationCode.invalidQuantity);
    }
    if (!price.isMultipleOf(priceTick)) {
      throw const TradeValidationException(
        TradeValidationCode.priceTickMismatch,
      );
    }
    if (!quantity.isMultipleOf(quantityStep)) {
      throw const TradeValidationException(
        TradeValidationCode.quantityStepMismatch,
      );
    }
    if (quantity < minimumOrderSize) {
      throw const TradeValidationException(
        TradeValidationCode.belowMinimumOrderSize,
      );
    }
    if (quantity > maximumOrderSize) {
      throw const TradeValidationException(
        TradeValidationCode.aboveMaximumOrderSize,
      );
    }
  }
}

enum TradeValidationCode {
  invalidPrice,
  invalidQuantity,
  priceTickMismatch,
  quantityStepMismatch,
  belowMinimumOrderSize,
  aboveMaximumOrderSize,
  insufficientJpy,
  insufficientAsset,
  invalidPosition,
}

final class TradeValidationException implements Exception {
  const TradeValidationException(this.code);

  final TradeValidationCode code;

  @override
  String toString() => 'TradeValidationException($code)';
}

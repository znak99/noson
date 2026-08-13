import 'package:flutter_test/flutter_test.dart';
import 'package:noson/src/trading/fixed_decimal.dart';
import 'package:noson/src/trading/trading_calculator.dart';
import 'package:noson/src/trading/trading_rules.dart';

void main() {
  final calculator = TradingCalculator();
  final btcRules = TradingRules.fromDecimalStrings(
    symbol: AssetSymbol.btc,
    minimumOrderSize: '0.00001',
    maximumOrderSize: '5',
    quantityStep: '0.00001',
    priceTick: '1',
    takerFeeRate: '0.0005',
    makerFeeRate: '-0.0001',
  );

  group('주문 규칙', () {
    test('MVP 5개 종목의 최소 수량과 가격·수량 단위를 검증한다', () {
      final cases =
          <
            ({
              AssetSymbol symbol,
              String minimum,
              String maximum,
              String step,
              String tick,
              String validPrice,
            })
          >[
            (
              symbol: AssetSymbol.btc,
              minimum: '0.00001',
              maximum: '5',
              step: '0.00001',
              tick: '1',
              validPrice: '10000000',
            ),
            (
              symbol: AssetSymbol.eth,
              minimum: '0.001',
              maximum: '100',
              step: '0.0001',
              tick: '1',
              validPrice: '500000',
            ),
            (
              symbol: AssetSymbol.xrp,
              minimum: '1',
              maximum: '100000',
              step: '1',
              tick: '0.001',
              validPrice: '321.123',
            ),
            (
              symbol: AssetSymbol.sol,
              minimum: '0.01',
              maximum: '500',
              step: '0.01',
              tick: '1',
              validPrice: '25000',
            ),
            (
              symbol: AssetSymbol.doge,
              minimum: '10',
              maximum: '200000',
              step: '1',
              tick: '0.001',
              validPrice: '25.123',
            ),
          ];

      for (final item in cases) {
        final rules = TradingRules.fromDecimalStrings(
          symbol: item.symbol,
          minimumOrderSize: item.minimum,
          maximumOrderSize: item.maximum,
          quantityStep: item.step,
          priceTick: item.tick,
          takerFeeRate:
              item.symbol == AssetSymbol.sol || item.symbol == AssetSymbol.doge
              ? '0.0009'
              : '0.0005',
          makerFeeRate:
              item.symbol == AssetSymbol.sol || item.symbol == AssetSymbol.doge
              ? '-0.0003'
              : '-0.0001',
        );

        expect(
          () => rules.validate(
            price: FixedDecimal.parse(item.validPrice),
            quantity: FixedDecimal.parse(item.minimum),
          ),
          returnsNormally,
          reason: item.symbol.code,
        );
      }
    });

    test('가격과 수량 단위가 맞지 않으면 입력을 반올림하지 않고 거부한다', () {
      expect(
        () => btcRules.validate(
          price: FixedDecimal.parse('10000000.5'),
          quantity: FixedDecimal.parse('0.001'),
        ),
        throwsA(
          isA<TradeValidationException>().having(
            (error) => error.code,
            'code',
            TradeValidationCode.priceTickMismatch,
          ),
        ),
      );
      expect(
        () => btcRules.validate(
          price: FixedDecimal.parse('10000000'),
          quantity: FixedDecimal.parse('0.000011'),
        ),
        throwsA(
          isA<TradeValidationException>().having(
            (error) => error.code,
            'code',
            TradeValidationCode.quantityStepMismatch,
          ),
        ),
      );
    });

    test('종목별 최소·최대 수량을 검증한다', () {
      expect(
        () => btcRules.validate(
          price: FixedDecimal.parse('10000000'),
          quantity: FixedDecimal.parse('0.000001'),
        ),
        throwsA(isA<TradeValidationException>()),
      );
      expect(
        () => btcRules.validate(
          price: FixedDecimal.parse('10000000'),
          quantity: FixedDecimal.parse('5.00001'),
        ),
        throwsA(isA<TradeValidationException>()),
      );
    });

    test('잘못된 공급자 거래 규칙을 거부한다', () {
      expect(
        () => TradingRules.fromDecimalStrings(
          symbol: AssetSymbol.btc,
          minimumOrderSize: '0.00001',
          maximumOrderSize: '5',
          quantityStep: '0.00001',
          priceTick: '0',
          takerFeeRate: '0.0005',
          makerFeeRate: '-0.0001',
        ),
        throwsArgumentError,
      );
    });
  });

  group('매수 계산', () {
    test('시장가 매수는 Taker 수수료를 취득원가에 포함한다', () {
      final result = calculator.executeMarketBuy(
        rules: btcRules,
        askPrice: FixedDecimal.parse('10000000'),
        quantity: FixedDecimal.parse('0.001'),
        availableJpy: FixedDecimal.parse('1000000'),
      );

      expect(result.grossAmount.toString(), '10000');
      expect(result.fee.toString(), '5');
      expect(result.totalDebit.toString(), '10005');
      expect(result.position.totalCostBasis.toString(), '10005');
    });

    test('추가 매수 평균가는 수수료 포함 가중평균이다', () {
      final first = calculator.executeMarketBuy(
        rules: btcRules,
        askPrice: FixedDecimal.parse('10000000'),
        quantity: FixedDecimal.parse('0.001'),
        availableJpy: FixedDecimal.parse('1000000'),
      );
      final second = calculator.executeMarketBuy(
        rules: btcRules,
        askPrice: FixedDecimal.parse('12000000'),
        quantity: FixedDecimal.parse('0.001'),
        availableJpy: FixedDecimal.parse('1000000'),
        currentPosition: first.position,
      );

      expect(second.position.totalCostBasis.toString(), '22011');
      expect(second.position.averageAcquisitionPrice.toString(), '11005500');
    });

    test('지정가 Maker 리베이트는 취득원가를 줄인다', () {
      final result = calculator.executeFilledLimitBuy(
        rules: btcRules,
        limitPrice: FixedDecimal.parse('10000000'),
        quantity: FixedDecimal.parse('0.001'),
        availableJpy: FixedDecimal.parse('1000000'),
      );

      expect(result.fee.toString(), '-1');
      expect(result.totalDebit.toString(), '9999');
    });

    test('가용 JPY가 수수료 포함 금액보다 작으면 거부한다', () {
      expect(
        () => calculator.executeMarketBuy(
          rules: btcRules,
          askPrice: FixedDecimal.parse('10000000'),
          quantity: FixedDecimal.parse('0.001'),
          availableJpy: FixedDecimal.parse('10004.999999999999'),
        ),
        throwsA(
          isA<TradeValidationException>().having(
            (error) => error.code,
            'code',
            TradeValidationCode.insufficientJpy,
          ),
        ),
      );
    });
  });

  group('매도와 손익 계산', () {
    late Position position;

    setUp(() {
      position = Position(
        quantity: FixedDecimal.parse('0.002'),
        totalCostBasis: FixedDecimal.parse('22011'),
      );
    });

    test('부분 매도는 취득원가를 비례 배분하고 수수료 차감 후 실현손익을 낸다', () {
      final result = calculator.executeMarketSell(
        rules: btcRules,
        bidPrice: FixedDecimal.parse('13000000'),
        quantity: FixedDecimal.parse('0.001'),
        currentPosition: position,
      );

      expect(result.grossAmount.toString(), '13000');
      expect(result.fee.toString(), '6.5');
      expect(result.netProceeds.toString(), '12993.5');
      expect(result.allocatedCostBasis.toString(), '11005.5');
      expect(result.realizedProfitLoss.toString(), '1988');
      expect(result.position.quantity.toString(), '0.001');
      expect(result.position.totalCostBasis.toString(), '11005.5');
    });

    test('전량 매도는 반올림 잔여 없이 보유 수량과 취득원가를 0으로 만든다', () {
      final result = calculator.executeMarketSell(
        rules: btcRules,
        bidPrice: FixedDecimal.parse('13000000'),
        quantity: FixedDecimal.parse('0.002'),
        currentPosition: position,
      );

      expect(result.position.quantity, FixedDecimal.zero);
      expect(result.position.totalCostBasis, FixedDecimal.zero);
    });

    test('지정가 Maker 리베이트는 매도 순수령액을 늘린다', () {
      final result = calculator.executeFilledLimitSell(
        rules: btcRules,
        limitPrice: FixedDecimal.parse('10000000'),
        quantity: FixedDecimal.parse('0.001'),
        currentPosition: position,
      );

      expect(result.fee.toString(), '-1');
      expect(result.netProceeds.toString(), '10001');
    });

    test('미실현손익은 Bid 평가금액에서 취득원가를 빼고 미래 수수료는 제외한다', () {
      final result = calculator.calculateUnrealized(
        position: position,
        bidPrice: FixedDecimal.parse('12000000'),
      );

      expect(result.valuation.toString(), '24000');
      expect(result.profitLoss.toString(), '1989');
      expect(result.rate.toString(), '0.090363908955');
    });

    test('보유량을 초과한 매도는 거부한다', () {
      expect(
        () => calculator.executeMarketSell(
          rules: btcRules,
          bidPrice: FixedDecimal.parse('13000000'),
          quantity: FixedDecimal.parse('0.003'),
          currentPosition: position,
        ),
        throwsA(
          isA<TradeValidationException>().having(
            (error) => error.code,
            'code',
            TradeValidationCode.insufficientAsset,
          ),
        ),
      );
    });
  });

  group('지정가 주문 예약', () {
    test('매수는 Maker 체결 예상과 무관하게 Taker 수수료까지 예약한다', () {
      final reserved = calculator.reserveLimitBuy(
        rules: btcRules,
        limitPrice: FixedDecimal.parse('10000000'),
        quantity: FixedDecimal.parse('0.001'),
        availableJpy: FixedDecimal.parse('10005'),
      );

      expect(reserved.toString(), '10005');
    });

    test('매수 예약금보다 가용 JPY가 작으면 거부한다', () {
      expect(
        () => calculator.reserveLimitBuy(
          rules: btcRules,
          limitPrice: FixedDecimal.parse('10000000'),
          quantity: FixedDecimal.parse('0.001'),
          availableJpy: FixedDecimal.parse('10004.999999999999'),
        ),
        throwsA(
          isA<TradeValidationException>().having(
            (error) => error.code,
            'code',
            TradeValidationCode.insufficientJpy,
          ),
        ),
      );
    });

    test('매도는 주문 수량을 예약하고 가용 수량 부족을 거부한다', () {
      expect(
        calculator
            .reserveLimitSell(
              rules: btcRules,
              limitPrice: FixedDecimal.parse('10000000'),
              quantity: FixedDecimal.parse('0.001'),
              availableQuantity: FixedDecimal.parse('0.002'),
            )
            .toString(),
        '0.001',
      );
      expect(
        () => calculator.reserveLimitSell(
          rules: btcRules,
          limitPrice: FixedDecimal.parse('10000000'),
          quantity: FixedDecimal.parse('0.003'),
          availableQuantity: FixedDecimal.parse('0.002'),
        ),
        throwsA(isA<TradeValidationException>()),
      );
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:noson/src/trading/fixed_decimal.dart';

void main() {
  group('FixedDecimal', () {
    test('10진 문자열을 손실 없이 왕복한다', () {
      expect(FixedDecimal.parse('123.4500').toString(), '123.45');
      expect(
        FixedDecimal.parse('-0.000000000001').toString(),
        '-0.000000000001',
      );
      expect(FixedDecimal.parse('-0').toString(), '0');
    });

    test('지수 표기와 12자리를 넘는 입력을 거부한다', () {
      expect(() => FixedDecimal.parse('1e-3'), throwsFormatException);
      expect(
        () => FixedDecimal.parse('0.0000000000001'),
        throwsFormatException,
      );
    });

    test('곱셈과 나눗셈을 12자리에서 반올림한다', () {
      expect(
        (FixedDecimal.parse('10.25') * FixedDecimal.parse('0.0005')).toString(),
        '0.005125',
      );
      expect(
        (FixedDecimal.parse('1') / FixedDecimal.parse('3')).toString(),
        '0.333333333333',
      );
    });

    test('단위 배수를 정확히 판정한다', () {
      expect(
        FixedDecimal.parse('0.0012').isMultipleOf(FixedDecimal.parse('0.0001')),
        isTrue,
      );
      expect(
        FixedDecimal.parse(
          '0.00125',
        ).isMultipleOf(FixedDecimal.parse('0.0001')),
        isFalse,
      );
    });

    test('JPY 표시는 정수 엔으로 절댓값 방향 반올림한다', () {
      expect(formatJpy(FixedDecimal.parse('1234.5')), '¥1,235');
      expect(formatJpy(FixedDecimal.parse('-1234.5')), '-¥1,235');
      expect(formatJpy(FixedDecimal.parse('1234.49')), '¥1,234');
    });
  });
}

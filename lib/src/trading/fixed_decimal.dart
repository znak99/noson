/// 거래 계산에 사용하는 12자리 고정소수점 수치다.
///
/// 외부 경계에서는 항상 10진 문자열로 변환하며 `double`을 사용하지 않는다.
final class FixedDecimal implements Comparable<FixedDecimal> {
  FixedDecimal._(this.scaledValue);

  static const int scale = 12;
  static final BigInt scaleFactor = BigInt.from(10).pow(scale);
  static final FixedDecimal zero = FixedDecimal._(BigInt.zero);
  static final FixedDecimal one = FixedDecimal._(scaleFactor);

  /// 소수점 이하가 12자리를 넘거나 지수 표기인 문자열은 거부한다.
  factory FixedDecimal.parse(String value) {
    final match = RegExp(r'^([+-]?)(\d+)(?:\.(\d+))?$').firstMatch(value);
    if (match == null) {
      throw FormatException('올바른 10진 문자열이 아닙니다.', value);
    }

    final fraction = match.group(3) ?? '';
    if (fraction.length > scale) {
      throw FormatException('소수점 이하 자릿수는 $scale자리를 넘을 수 없습니다.', value);
    }

    final integerUnits = BigInt.parse(match.group(2)!) * scaleFactor;
    final fractionUnits = fraction.isEmpty
        ? BigInt.zero
        : BigInt.parse(fraction.padRight(scale, '0'));
    final unsigned = integerUnits + fractionUnits;
    return FixedDecimal._(match.group(1) == '-' ? -unsigned : unsigned);
  }

  factory FixedDecimal.fromScaledValue(BigInt value) => FixedDecimal._(value);

  final BigInt scaledValue;

  bool get isZero => scaledValue == BigInt.zero;
  bool get isNegative => scaledValue.isNegative;

  FixedDecimal get abs => FixedDecimal._(scaledValue.abs());

  FixedDecimal operator +(FixedDecimal other) =>
      FixedDecimal._(scaledValue + other.scaledValue);

  FixedDecimal operator -(FixedDecimal other) =>
      FixedDecimal._(scaledValue - other.scaledValue);

  FixedDecimal operator -() => FixedDecimal._(-scaledValue);

  FixedDecimal operator *(FixedDecimal other) => FixedDecimal._(
    _divideRoundHalfAwayFromZero(scaledValue * other.scaledValue, scaleFactor),
  );

  FixedDecimal operator /(FixedDecimal other) {
    if (other.isZero) {
      throw UnsupportedError('0으로 나눌 수 없습니다.');
    }
    return FixedDecimal._(
      _divideRoundHalfAwayFromZero(
        scaledValue * scaleFactor,
        other.scaledValue,
      ),
    );
  }

  /// 현재 값에 `part / whole`을 곱하면서 중간 반올림을 피한다.
  FixedDecimal proportional(FixedDecimal part, FixedDecimal whole) {
    if (whole.isZero) {
      throw UnsupportedError('0으로 나눌 수 없습니다.');
    }
    return FixedDecimal._(
      _divideRoundHalfAwayFromZero(
        scaledValue * part.scaledValue,
        whole.scaledValue,
      ),
    );
  }

  bool isMultipleOf(FixedDecimal step) {
    if (step.scaledValue <= BigInt.zero) {
      throw ArgumentError.value(step, 'step', '단위는 0보다 커야 합니다.');
    }
    return scaledValue % step.scaledValue == BigInt.zero;
  }

  /// 지정한 소수 자릿수로 반올림한 문자열을 반환한다.
  String toFixed(int fractionDigits) {
    if (fractionDigits < 0 || fractionDigits > scale) {
      throw RangeError.range(fractionDigits, 0, scale, 'fractionDigits');
    }

    final divisor = BigInt.from(10).pow(scale - fractionDigits);
    final rounded = _divideRoundHalfAwayFromZero(scaledValue, divisor);
    final negative = rounded.isNegative;
    final digits = rounded.abs().toString().padLeft(fractionDigits + 1, '0');
    if (fractionDigits == 0) {
      return '${negative ? '-' : ''}$digits';
    }
    final split = digits.length - fractionDigits;
    return '${negative ? '-' : ''}${digits.substring(0, split)}.'
        '${digits.substring(split)}';
  }

  BigInt roundToInteger() =>
      _divideRoundHalfAwayFromZero(scaledValue, scaleFactor);

  @override
  int compareTo(FixedDecimal other) => scaledValue.compareTo(other.scaledValue);

  bool operator <(FixedDecimal other) => compareTo(other) < 0;
  bool operator <=(FixedDecimal other) => compareTo(other) <= 0;
  bool operator >(FixedDecimal other) => compareTo(other) > 0;
  bool operator >=(FixedDecimal other) => compareTo(other) >= 0;

  @override
  String toString() {
    if (isZero) {
      return '0';
    }

    final negative = isNegative;
    final digits = scaledValue.abs().toString().padLeft(scale + 1, '0');
    final split = digits.length - scale;
    final integer = digits.substring(0, split);
    final fraction = digits.substring(split).replaceFirst(RegExp(r'0+$'), '');
    return '${negative ? '-' : ''}$integer${fraction.isEmpty ? '' : '.$fraction'}';
  }

  @override
  bool operator ==(Object other) =>
      other is FixedDecimal && scaledValue == other.scaledValue;

  @override
  int get hashCode => scaledValue.hashCode;

  static BigInt _divideRoundHalfAwayFromZero(
    BigInt numerator,
    BigInt denominator,
  ) {
    if (denominator == BigInt.zero) {
      throw UnsupportedError('0으로 나눌 수 없습니다.');
    }

    final negative = numerator.isNegative != denominator.isNegative;
    final absoluteNumerator = numerator.abs();
    final absoluteDenominator = denominator.abs();
    var quotient = absoluteNumerator ~/ absoluteDenominator;
    final remainder = absoluteNumerator % absoluteDenominator;
    if (remainder * BigInt.two >= absoluteDenominator) {
      quotient += BigInt.one;
    }
    return negative ? -quotient : quotient;
  }
}

String formatJpy(FixedDecimal value) {
  final rounded = value.roundToInteger();
  final negative = rounded.isNegative;
  final digits = rounded.abs().toString();
  final buffer = StringBuffer();

  for (var index = 0; index < digits.length; index++) {
    if (index > 0 && (digits.length - index) % 3 == 0) {
      buffer.write(',');
    }
    buffer.write(digits[index]);
  }

  return '${negative ? '-' : ''}¥$buffer';
}

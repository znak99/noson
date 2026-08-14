import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:noson/src/features/onboarding/data/installation_id_generator.dart';

void main() {
  test('UUID v4 버전과 RFC 4122 variant를 지켜 중복 없이 생성한다', () {
    final generator = SecureUuidV4Generator(random: Random(42));
    final values = List.generate(100, (_) => generator.generate());
    final pattern = RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
    );

    expect(values.toSet(), hasLength(values.length));
    expect(values, everyElement(matches(pattern)));
  });
}

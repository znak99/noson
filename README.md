# Noson

Noson(ノー損)은 실제 시장 데이터를 사용하는 일본어 암호화폐 현물 모의투자 앱이다. 실제 금융거래, 자산 보관, 송금 또는 입출금은 수행하지 않으며 앱의 자산과 손익은 모두 가상 데이터이다.

## 지원 플랫폼

- Android
- iOS

Linux, macOS, Web 및 Windows는 출시·검증 대상이 아니다.

## 개발 명령

```bash
flutter pub get
dart run build_runner build
dart format lib test
flutter analyze
flutter test
flutter build apk --debug
```

iOS 빌드는 macOS와 Xcode가 준비된 환경에서 별도로 검증한다. 제품 범위와 기술 결정은 `docs/SYSTEM_DESIGN_V1.md`, 작업 현황은 `TODO.md`를 따른다.

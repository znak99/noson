# Flutter 앱 기반 구조 검증

## 1. 검증 개요

- 확인일: 2026-08-14
- Flutter: `3.41.9`
- Dart: `3.11.5`
- 출시·검증 대상: Android, iOS
- 제외 플랫폼: Linux, macOS, Web, Windows

기본 카운터 예제를 제거하고 Flutter 기본 `Navigator`, Riverpod의 전역 `ProviderScope`, 기능 중심 디렉터리와 일본어 3개 탭 앱 셸을 구성했다. Repository는 네트워크 또는 데이터베이스 접근이 생기는 기능에만 추가하고, 별도 UseCase 계층은 복잡한 도메인 조합이 실제로 필요해질 때까지 두지 않는다.

## 2. 의존성 검토

| 패키지 | 적용 버전 | 필요성 | 라이선스 | Android/iOS 지원 확인 |
|---|---:|---|---|---|
| [`flutter_localizations`](https://api.flutter.dev/flutter/flutter_localizations/) | Flutter SDK | 일본어 로케일과 Material 위젯 현지화 | Flutter SDK 라이선스 | 확인 |
| [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod) | `3.3.2` | 기능별 상태와 의존성 경계 | MIT | 확인 |
| [`drift`](https://pub.dev/packages/drift) | `2.34.3` | 자산·주문·설정의 SQLite 영속화 | MIT | 확인 |
| [`drift_flutter`](https://pub.dev/packages/drift_flutter) | `0.3.1` | 모바일 Drift 데이터베이스 연결 | MIT | 확인 |
| [`http`](https://pub.dev/packages/http) | `1.6.0` | Public REST 시장 데이터 조회 | BSD-3-Clause | 확인 |
| [`web_socket_channel`](https://pub.dev/packages/web_socket_channel) | `3.0.3` | 실시간 시세 WebSocket 연결 | BSD-3-Clause | 확인 |
| [`fl_chart`](https://pub.dev/packages/fl_chart) | `1.2.0` | 종목 가격 라인 차트 | MIT | 확인 |

확인 시점의 최신 `flutter_riverpod 3.4.2`는 Dart 3.12 이상을 요구하므로 Dart 3.11.5와 호환되는 최신 안정판 `3.3.2`를 선택했다. 실제 해석 버전은 `pubspec.lock`에 고정한다. Drift 스키마가 아직 없으므로 코드 생성 도구는 추가하지 않았으며 다음 스키마 구현 작업에서 필요한 개발 의존성만 도입한다.

## 3. 코드 구조

```text
lib/
├── main.dart
└── src/
    ├── app/                 # 앱, 테마, 라우팅, 메인 탭 상태
    ├── features/
    │   ├── market/          # 종목 화면
    │   ├── portfolio/       # 자산 화면
    │   └── menu/            # 메뉴 화면
    └── shared/presentation/ # 공통 모의투자 고지
```

UI에는 준비되지 않은 가상 시세를 표시하지 않고, 모든 탭에 실제 거래가 아닌 시뮬레이션이라는 일본어 고지를 유지한다.

## 4. 검증 결과

| 항목 | 결과 |
|---|---|
| `dart format lib test` | 통과 |
| `flutter analyze` | 문제 없음 |
| `flutter test` | 23개 테스트 통과 |
| `flutter build apk --debug` | 통과, `build/app/outputs/flutter-apk/app-debug.apk` 생성 |
| iOS 빌드 | 현재 Linux 환경에서는 실행 불가 |

Android 빌드 중 설치된 Android Studio와 command-line tools 사이의 SDK XML 버전 차이 경고가 한 번 출력됐지만 APK 생성은 성공했다. 도구 버전을 맞추는 작업은 출시 빌드 환경 구성 시 확인한다. iOS는 macOS, Xcode 및 서명 설정이 준비된 CI 또는 개발 환경에서 `flutter build ios --no-codesign`과 실제 기기 렌더링을 출시 게이트로 검증한다.

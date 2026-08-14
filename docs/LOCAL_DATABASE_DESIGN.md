# Drift 로컬 데이터베이스 설계

## 1. 목적과 범위

이 문서는 Noson의 Installation ID, 앱 설정, JPY 잔액, 자산 포지션, 주문 캐시와 체결 내역을 Android·iOS 기기 안에 저장하는 Drift/SQLite 스키마의 기준을 정의한다.

- 확정일: 2026-08-14
- 스키마 버전: `1`
- 데이터베이스 파일명: `noson.sqlite`
- 런타임: `drift 2.34.0`, `drift_flutter 0.3.1`
- 생성 도구: `drift_dev 2.34.0`, `build_runner 2.15.1`

현재 Flutter 3.41.9가 `meta 1.17.0`을 고정하므로 최신 `drift_dev 2.34.3`과 `build_runner 2.15.3`은 해석할 수 없다. 런타임과 생성 도구의 내부 API 불일치를 피하기 위해 Drift는 `2.34.0`으로 맞추고, Dart 3.11을 지원하는 `build_runner 2.15.1`을 정확히 고정한다.

## 2. 테이블

| 테이블 | 역할 | 주요 제약 |
|---|---|---|
| `app_installations` | 설치 식별자, 생성 시각, 온보딩 상태, 포트폴리오 세대 | 단일 행 `id = 1`, Installation ID 고유, generation 1 이상 |
| `app_settings` | 아직 유형이 확정되지 않은 앱 설정 | 키 기본키, 1~100자, UTC 갱신 시각 |
| `jpy_balances` | 가용·예약 JPY | 단일 행 `id = 1`, 고정소수점 TEXT |
| `asset_positions` | 종목별 수량, 총 취득원가, 예약 수량 | 지원 5개 종목만 허용, 종목 기본키 |
| `local_orders` | 시장가·지정가 주문과 서버 동기화 캐시 | UUID·멱등성 키 고유, 종목·매수/매도·주문 유형 제약, 시장가는 요청 가격 없음 |
| `trade_executions` | 주문별 불변 체결 기록 | 주문당 최대 1건, 주문 삭제 시 함께 삭제, Maker/Taker 제약 |

모든 테이블은 SQLite `STRICT` 모드를 사용한다. 주문의 상세 상태 문자열은 백엔드 상태 전이 결정 전까지 확장 가능한 TEXT로 저장하고, 리셋 차단 여부는 상태 이름과 분리한 `is_terminal`로 판단한다. 부분 체결을 지원하지 않으므로 주문과 체결은 1:0 또는 1:1 관계다.

## 3. 수치와 시각

- 금액, 가격, 수량과 수수료는 SQLite `TEXT`로 저장한다.
- Drift `FixedDecimalConverter`가 `FixedDecimal`과 정규화된 10진 문자열 사이를 변환한다.
- 잘못된 문자열, 지수 표기와 소수점 이하 12자리를 넘는 값은 읽기·쓰기 경계에서 거부한다.
- 시각은 UTC Unix epoch 기준 마이크로초 `INTEGER`로 저장한다.
- `double`, SQLite `REAL`과 부동소수점 변환은 사용하지 않는다.

## 4. 최초 초기화와 리셋

최초 초기화는 하나의 SQLite 트랜잭션에서 다음 두 행을 생성한다.

1. RFC 4122 UUID v4 형식의 익명 Installation ID와 generation `1`
2. 가용 JPY `1000000`, 예약 JPY `0`

같은 설치에서 초기화를 다시 호출하면 기존 ID와 잔액을 반환하며 새 가상자금을 지급하지 않는다. ID 또는 잔액 생성이 실패하면 전체 트랜잭션을 롤백한다.

포트폴리오 리셋은 다음 원칙을 따른다.

- Installation ID, 앱 설정과 온보딩 완료 상태는 유지한다.
- 미체결 또는 동기화가 끝나지 않은 `is_terminal = false` 주문이 있으면 리셋을 거부한다.
- 종료 주문, 체결 내역과 자산 포지션을 삭제한다.
- JPY를 `¥1,000,000`으로 초기화하고 generation을 1 증가시킨다.
- 삭제와 재초기화는 하나의 트랜잭션으로 수행한다.

3개월 리셋 가능 시점과 사용자 화면은 별도 온보딩·리셋 작업에서 구현한다.

## 5. 마이그레이션 정책

- DB 자동 삭제, 재생성 또는 destructive fallback을 사용하지 않는다.
- 스키마 변경마다 `schemaVersion`을 1 증가시키고 이전 버전에서 다음 버전으로 가는 명시적 전진 마이그레이션을 작성한다.
- `drift_schemas/app_database/`의 JSON 스냅샷과 `test/database/migrations/generated/`의 검증 코드를 저장소에 커밋한다.
- 각 변경에서 기존 fixture를 이전 버전 DB에 넣고 마이그레이션 후 보존됐는지 검증한다.
- 정의되지 않은 버전 이동은 즉시 실패시키고 데이터베이스를 임의로 초기화하지 않는다.

공식 Drift의 [마이그레이션 개요](https://drift.simonbinder.eu/migrations/), [스키마 내보내기](https://drift.simonbinder.eu/migrations/exports/) 및 [마이그레이션 테스트](https://drift.simonbinder.eu/migrations/tests/) 절차를 따른다.

```bash
dart run build_runner build
dart run drift_dev make-migrations
dart run drift_dev schema generate --data-classes --companions \
  drift_schemas/app_database test/database/migrations/generated
```

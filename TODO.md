# Noson TODO

이 문서는 사용자와 합의된 프로젝트 작업의 상태를 관리한다. 등록, 우선순위 및 상태 이동 규칙은 `docs/TODO_GUIDE.md`를 따른다.

## 미대응

1. **GMO Coin Public API 제3자 이용 조건 공식 문의 및 답변 반영**
   - 구체적인 설명: 준비된 일본어 문안을 GMO Coin 공식 문의 양식으로 제출하고, 제3자 모바일 앱의 시세 재표시·캐시·가공, Cloudflare Worker의 정기 1분봉 조회, 출처·상표 표시, Public REST 호출 제한 및 스토어 배포 조건에 대한 답변을 확보한다. 제출일과 문의 번호, 답변 내용을 `docs/GMO_COIN_API_VALIDATION.md`에 기록하고, 결과에 따라 `docs/SYSTEM_DESIGN_V1.md`에서 GMO Coin 채택을 확정하거나 대체 데이터 공급자 검토로 전환한다.

## 진행중

진행 중인 작업이 없습니다.

## 완료

- **GMO Coin Public API 사용 가능성 및 데이터 계약 검증**
  - 구체적인 설명: 최신 공식 API 문서와 약관을 기준으로 제3자 모바일 앱의 시세 표시 허용 범위를 확인하고, `BTC`, `ETH`, `XRP`, `SOL`, `DOGE`의 ticker, orderbook, 1분봉 응답과 호출 제한, 가격·수량 정밀도, 최소 주문 단위 및 Maker/Taker 수수료를 검증한다. 확인 결과와 필요한 문의 내용, 주 데이터 공급자 채택 여부 또는 대체 공급자 검토 조건을 문서화한다.
  - 완료 내용: 공식 자료와 2026-08-13 실응답을 기준으로 GMO Coin Public API가 MVP 5개 종목에 기술적으로 적합함을 확인했다. 거래 없는 분의 1분봉 누락, 일본시간 06:00 날짜 전환, WebSocket 순차 구독 및 REST 선초기화 요구를 식별했다. 제3자 앱의 재표시와 Cloudflare 정기 조회는 공개 자료만으로 허용 여부를 확정할 수 없어 조건부 주 데이터 공급자로 판단하고, `docs/GMO_COIN_API_VALIDATION.md`에 공식 출처, 데이터 계약, 종목별 주문 규칙·수수료, 일본어 문의 문안 및 대체 공급자 검토 조건을 기록했다. 관련 결정을 `docs/SYSTEM_DESIGN_V1.md`에도 반영했다.
  - 검증: Public REST의 status, ticker, orderbook, 당일 1분봉 및 symbols를 읽기 전용으로 호출해 5개 종목의 `status == 0`, 필수 필드, 정밀도, 최소·최대 주문 수량과 Maker/Taker 수수료를 확인했다. Public WebSocket에서는 초당 1회 구독 제한을 지켜 5개 종목 orderbooks의 Ask/Bid 스냅샷 수신을 확인했다. ticker는 45초 관찰 중 BTC만 수신되어 초기 스냅샷으로 사용할 수 없음을 기록했다. `git diff --check`, TODO의 3개 고정 섹션과 항목 형식, `AGENTS.md`와 `CLAUDE.md`의 바이트 단위 동일성을 확인했다. 제3자 재표시 허용과 Public REST 정량 제한은 공식 문의 답변이 필요한 잔여 위험으로 남겼다.
- **프로젝트 운영 문서 초기화 및 시스템 설계 재정리**
  - 구체적인 설명: `docs/SYSTEM_DESIGN_V1.md`를 AI Agent가 빠르게 해석할 수 있는 구조로 재작성하고, 동일한 `AGENTS.md`와 `CLAUDE.md`, 루트 `TODO.md`, `docs/TODO_GUIDE.md`를 작성한다.
  - 완료 내용: 시스템 설계를 결정 상태, 제품 범위, 거래 규칙, 컴포넌트 책임, 데이터 정책, 출시 확인 사항과 구현 전 결정 항목 중심으로 재구성했다. 공통 Agent 규칙과 TODO 생명주기 및 형식을 새 문서에 정의했다.
  - 검증: `AGENTS.md`와 `CLAUDE.md`의 바이트 단위 동일성, TODO의 고정 3개 섹션, 필수 정책 문서 참조, 목록 형식과 문서의 후행 공백 부재를 확인했다.

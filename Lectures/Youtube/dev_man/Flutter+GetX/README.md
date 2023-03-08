# Flutter+GetX
**Fast, Stable, Extra-light and Powerful Flutter Framework**

## 01. GetX?
- Flutter 개발을 위한 매우 가볍고 강력한 라이브러리
- 단순 상태 관리 뿐만 아니라 여러 모듈을 제공
- 이에 어떤 사람들은 미니 프레임워크라고 부를 정도로 플러터 프로젝트를 효과적인 관리가 가능하게 해줌
- 3가지 기본 원칙
    - 생산성: 어떻게 빠르고 효율적으로 개발하는지
    - 성능: 퍼포먼스 성능 뿐만 아니라, 시스템적으로 메모리 최적화 등을 고려
    - 조직화: 화면, 로직 등 각각 필요한 부분만을 전문적으로 제공 (클린 코드)
- 3가지 주요 기능
    - 상태 관리, 라우트 관리, 종속성 관리
    - 상태관리로만 사용할 때보다는, 라우트 관리와 종속성 관리를 위해 Get을 사용

## 02. 라우트 관리
- 기본 페이지 라우팅 (기존 Navigator와 GetX route 차이)
- Route 선언 (기존 방식과 GetX route 차이)
- Named 페이지 라우팅 (기존 Navigator와 GetX route 차이)
- 페이지 전환 효과 적용
- arguments 전달
- 동적 링크 사용

### 03. 단순 상태 관리
- 단순 상태 관리자(GetBuilder)는 기존의 ChangeNotifierProvider와 거의 비슷하다고 볼 수 있음
## Chapter 10. MVVM Design Pattern

### Design Pattern 기초
- '디자인 패턴'은 개발을 유지보수하기 쉽게 만드는 등 코딩을 잘 짜기 위한 패턴
- 디자인 패턴의 추상적 목표는 '기술부채 최소화', '재사용 및 지속 가능'한 코드 작성
- 구체적 측면으로는 코드 구조에 대한 전략
- 위에 대한 고민의 결과가 클린 아키텍처, 디자인 패턴

### MVC
- MVVM 이전에 프로그래밍 업계에서 가장 많이 쓰이던 디자인 패턴
- Model - View - Controller
- Model: 데이터 (Struct)
- View: UI 요소 (UIView)
- Controller: 중계자 (UIViewController), 모델과 뷰 사이에서 소통
- 개발을 하다보면 중계자인 Controller에 많은 역할이 부야되어, 코드가 많아져 기술부채가 자주 발생 
- 이로 인해, Massive View Contoller라는 비아냥도 받음

### MVVM
- 요즘 앱 개발에서 가장 많이 쓰이는 디자인 패턴
- Model - View - ViewModel
- Model: 데이터 (Struct)
- View: UI 요소 (UIView, UIViewController)
- ViewModel: 중계자 (ViewModel)
- MVVM은 결국 Controller의 역할을 축소시킴으로 할 일이 좀 더 명확해지도록 함
- ViewContoller는 View와 ViewModel을 가지며, 이들은 ViewLayer에 속함
- ViewModel은 중계자의 역할로 Model이 ViewLayer와 직접 소통하지 않도록 함

### 리팩터링
- 기술부채를 줄이고 재사용 및 지속 가능성을 늘리며, 유지보수 비용을 줄이기 위해 '코드를 수정'하는 과정
- 동일하게 작동하지만 내부의 코드만 수정하는 것
- 라팩터링에서 중요한 원칙들
    - 중복 제거: 중복되는 코드는 최대한 제거
    - 단일 책임 갖기: 작게는 메소드, 크게는 오브젝트 단위에서 단일 책임을 갖도록 수정
    - 10, 200 rule: 메소드는 10 줄 안에, 클래스는 200 줄 안에 작성 (10, 200이 힘들면 우선 30, 400으로 훈련)

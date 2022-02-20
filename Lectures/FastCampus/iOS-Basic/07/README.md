## Chapter 07. Swift Structure
- 구조체는 '서로 관계가 있는 것들을 묶어서 표현'하는 것
- Object = Data + Method
- Structure vs. Class
    - Structure : Value Types, Copy, Stack에서 생성
    - Class : Referene Type, Share, Heap에서 생성
- struct name { } 안에 변수, 메소드 등을 선언하여 사용

### Protocol
- 규약, 지켜야하는 약속, 꼭 구현되어야 하는 메소드나 프로퍼티 목록
- 쉽게 말해, 어떤 서비스를 이용해야할 때 해야할 일들의 목록 (회원가입, 이용권 결재 등)
- CustomStringConvertible을 사용해 Description을 직접 만들 수 있음
- Protocol은 고급 프로그래밍을 위해 많이 쓰일 필요가 있음

### Property
- Object = Data + Method에서 Data 부분을 Property라고 함
- 'Stored Property'는 변수 등 저장된 값을 선언 및 갖고 있는 부분
- 'Computed Property'는 어떤 값을 직접 저장하진 않고, 저장된 값을 이용해 가공이나 계산 등을 수행 (Read-Only)
- Computed Property는 var 키워드만 가능, get { } set { }을 이용해 값을 임의로 세팅할 수도 있음
- Stored Property와 Computed Property는 'Instance Property'의 종류
- 'Type Property'는 생성된 인스턴트와 상관 없이, struct 혹은 class 타입 자체의 속성을 정하고자 할 때 사용 (static 키워드 사용)
- Stored Property는 값이 바뀌는 경우에 그 시점을 감지할 수 있음
    - willSet: 값이 변경되기 전에 실행
    - didSet: 값이 변경된 후에 실행
- Lazy Property: 인스턴스가 생성될 때가 아닌, 해당 프로퍼티에 접근해야 코드가 실행 (lazy 키워드 사용)
- Lazy Property는 엔지니어링 측면에서 최적화하는 작업에 사용 (Cost를 최대한 줄임, 효율화 차원)
- Computed Property vs. Method
    - Property: 호출시 (저장된) 값을 하나 반환한다!
    - Method: 호출시 어떤 작업을 한다.
    - 만약 Method가 그냥 값을 리턴하는 작업을 한다면 두 방법이 동일한 결과
    - Setter가 필요하면 Computed Property 사용
    - Setter가 필요하지 않을 때, 계산이 많이 필요하거나 DB Access, File IO가 필요하면 Method 사용, 아니라면 Computed Property 사용

### Method
- Method는 기본적으로 funciton과 마찬가지로 어떤 기능을 수행하는 코드 블록, struct나 class 안에서 동작
- struct의 method를 작성할 때, Stored Property를 건드리는 경우 func 앞에 'mutating' 키워드 필요
- Type Method는 Type Property처럼 그 자체의 속성을 설정할 때 사용 (static func 키워드 사용)
- Method Extension
    - 이미 만든 struct에 Method를 추가할 때 사용 (extension 키워드 사용)
    - 예를 들면, Int 타입에 square, half 등의 메소드를 추가할 수 있음
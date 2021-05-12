## Chapter 06. Swift Collection
- 다양학게 생성된 변수들을 관리하는 방법 (순차적, 라벨링 등)

### Array
- 하나의 Array에 들어가는 모든 Element는 같은 Type으로 담아야 함
- Array의 Element에는 Index라는 순번이 존재 (0부터 시작)
- Array는 '순서가 있는 아이템' 혹은 '아이템의 순서를 알면 유용할 때' 주로 사용
- var name: [type] = [~, ~, ~]
- var name: Array<type> = [~, ~, ~]
- .append(), += [], .append(contentsOf: [])로 요소 추가 가능
- .isEmpty, .count 등
- .first, .last, .min(), .max() 등 (옵셔널 값)
- 요소에 해당하는 인덱스 번호로 값을 인덱싱하여 접근 및 수정 가능
- 인덱스를 [0...2]와 같이 range를 사용할 수도 있음
- .contains(값), .insert(값, at: 인덱스), .removeAll(), .remove(at: 인덱스)
- .swapAt(인덱스, 인덱스), .enumerated()
- .dropFirst(n), .dropLast(n), .prefix(n), .suffix(n): 실제 array에 직접 영향 X, 변수로 선언 필요
- '.isEmpty, .count, 인덱싱, for문 활용' 정도가 중요, 나머지는 필요할 때 찾아서 사용

### Dictionary
- 순서가 없는 key와 value의 짝으로 이루어지며, 딕셔너리 내에서 하나의 key는 유일함
- 값을 '의미 단위'로 찾을 때 유용함 (Array는 순서 기반)
- var name: [type: type] = [key: value, ...]
- var name: Dictionary<type, type> = [key: value, ...]
- 'name[key]'로 value를 Optional로 받음 (옵셔널 바인딩을 해주면 좋음)
- name = [:], .isEmpty, .count
- name[key] = value 로 값 추가 및 갱신 가능, value를 nil로 설정하면 삭제
- for문에 활용 가능 (.keys 등, 순서 보장 X)

### Set
- Set은 순서가 없고, 각 유일한 값을 갖는 타입
- 중복이 없는 유니크한 아이템들을 관리할 때, 순서가 중요하지 않을 때 등에 사용
- var Set\<type> = [value, value, ...] -> 중복된 value는 자동 제거
- .isEmpty, .count, .contain(value)
- .insert(value)로 값 추가, .remove(value)로 값 삭제

### Closure
- Closure는 쉽게 말해 '이름이 없는 메소드(함수)'
- 함수는 func 키워드를 이용해 만들며, 어떤 기능을 수행하는 코드 블록을 뜻함
- Closure란 함수처럼 기능을 수행하는 코드 블록의 특별한 타입, 정확히는 함수도 하나의 Closure 타입
- Closure는 크게 3가지 타입이 있음 (Global 함수, Nested 함수, Closure Expressions)
- 여기서 배우는 Closure는 'Closure Expressions'를 뜻함
- 함수처럼 기능을 수행하는 코드 블록이지만, 함수와 다르게 이름이 없고, func 키워드 사용 X (함수와 공통점과 차이점이 존재)
- 함수와 클로져 둘 다 인자를 받을 수 있고, 값을 리턴 가능하고, 변수로 할당 가능하고, First Class Type이라는 점 등 다양한 공통점이 존재
- First Class Type는 변수에 할당 가능, 인자로 받을 수 있음, 리턴 가능하다는 특성을 가짐
- 함수나 메소드에서 Closure를 파라미터로 받는 경우가 많음
- Closure는 Completion Block과 Higher Order Functions에서 자주 사용
- Completion Block은 어떤 Task가 끝난 후 수행해야 하는 코드 블록을 말함
- Higher Order Functions(고계함수)는 input으로 인자를 함수로 받을 수 유형의 함수를 말함 (map, filter, reduce 등)
- input이나 output이 존재하지 않게도 만들어 사용 가능
- Capturing Values: Closure에 의해 잡혀서 안쪽에 선언된 변수를 scope 밖에서도 사용 가능한 것

### Closure Syntax
- Closure 문법을 일반화 한 모습은 아래와 같다.  
  { (parameters) -> return type in  
  &nbsp;&nbsp;&nbsp;&nbsp;statements  
  }
- in 키워드를 기준으로 앞에는 parameter와 return type, 뒤에는 statement 절이 옴
- 아무 것도 리턴하지 않을 경우 타입에 Void를 적음
- 함수에서 받는 인자가 많아지면 코드가 지저분해지는데, 클로져가 마지막 인자인 경우엔 해당 인자를 생략하고 바로 클로져를 작성하여 선언 가능 (Trailing Closure)
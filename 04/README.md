## Chapter 04. Swift Flow Control

- 앞서 배웠던 if-else 구문도 Flow Control 기법 중 하나
- While loop, For loop, Switch statement 등이 있음

### While loop
- While은 지정한 조건이 만족하는 동안 그 안의 코드를 반복
- 중간에 조건을 넣어 break로 중간에 탈출 가능
- Repeat에 while을 주어도 비슷한 역할을 수행
- While은 조건 검사를 먼저, Repeat은 코드를 수행 후 조건을 검사

### For loop
- let closedRangee = 0...10 은 0 이상 10 이하
- let halfClosedRange = 0..<10 은 0 이상 10 미만
- for 내부에 if-else를 사용하거나 in 뒤에 where을 사용해 조건을 줄 수 있음
- continue를 사용해 그 아래 코드를 수행하지 않고 다음 반복으로 스킵 가능

### Switch
- case를 사용해 조건에 맞는 코드를 실행 가능
- switch에 들어올 수 있는 모든 case를 커버해야함 (default 설정 가능)
- case가 맞으면 해당하는 코드를 실행한 후 switch 탈출
- 한 case에 여러 개의 조건을 넣을 수 있음 (0...10 등)
- case 뒤에 where을 사용하여 추가적인 조건 검사 가능
- _로 값을 설정하지 않거나, 변수를 할당해 case 안에서 사용할 수도 있음
- Switch 문을 사용하면 보다 넓고 다양한 코드 작성 가능
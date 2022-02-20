import UIKit

/*
{ (params) -> return type in
    statements
    .....
}
*/

// Example 1: Cho Simple Closure
let choSimpleClosure = {
    
}

choSimpleClosure()


// Example 2: 코드블록을 구현한 Closure
let choSimpleClosure2 = {
    print("Hello, 클로져. 코로나 하이!")
}

choSimpleClosure2()


// Example 3: Input 파라미터를 받는 Closure
let choSimpleClosure3: (String) -> Void = { name in
    print("Hello, 클로져. 코로나 하이! 나의 이름은 \(name) 입니다!")
}

choSimpleClosure3("코로나가 제일 싫어")


// Example 4: 값을 리턴하는 Closure
let choSimpleClosure4: (String) -> String = { name in
    let message = "iOS 개발 만만세, \(name)님 경제적 자유를 얻으실 거에요!"
    return message
}

let result = choSimpleClosure4("코로나가 제일 싫어")
print(result)


// Example 5: Closure를 파라미터로 받는 함수 구현
/*
func someSimpleFunction(choSimpleClosure: () -> Void) {
    print("함수에서 호출이 되었어요.")
}

someSimpleFunction(choSimpleClosure: {
    print("Hello Corona from closure.")
})
*/

func someSimpleFunction(choSimpleClosure: () -> Void) {
    print("함수에서 호출이 되었어요.")
    choSimpleClosure()
}

someSimpleFunction(choSimpleClosure: {
    print("Hello Corona from closure.")
})


// Example 6: Trailing Closure
func someSimpleFunction2(message: String, choSimpleClosure: () -> Void) {
    print("함수에서 호출이 되었어요. 메시지는 \(message)")
    choSimpleClosure()
}

someSimpleFunction2(message: "로나로나 메로나, 코로나는 극혐", choSimpleClosure: {
    print("Hello Corona from closure.")
})

someSimpleFunction2(message: "로나로나 메로나, 코로나는 극혐") {
    print("Hello Corona from closure.")
}

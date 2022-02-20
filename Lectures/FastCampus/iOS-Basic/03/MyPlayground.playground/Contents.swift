import UIKit

//var greeting = "Hello, playground"


let value = arc4random_uniform(100)
print("--> \(value)")

/*
 여기에 여러분이 하시고 싶은 말을
 길게 작성하셔서
 메시지를 남겨 놓으시면 되겠습니다.
 동료야 사랑해
 */

// --- Tuple

let coordinates = (4, 6)

let x = coordinates.0
let y = coordinates.1

let coordinatesNamed = (x: 2, y: 3)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let (x3, y3) = coordinatesNamed
x3
y3


// --- Boolean

let yes = true
let no = false

let isFourGreaterThanFive = 4 > 5

if isFourGreaterThanFive {
    print("---> 참")
} else {
    print("---> 거짓")
}

//if 조건..... {
//    // 조건이 참인 경우에 수행하는 코드
//} else {
//    // 그렇지 않은 경우의 코드
//}


let a = 5
let b = 10

if a > b {
    print("---> a가 크다")
} else {
    print("---> b가 크다")
}


let name1 = "Jin"
let name2 = "Jason"

let isTwoNameSame = name1 == name2

if isTwoNameSame {
    print("---> 이름이 같다")
} else {
    print("---> 이름이 다르다")
}


let isJason = name2 == "Jasong"
let isMale = true

let JasonAndMale = isJason && isMale
let JasonOrMale = isJason || isMale

//let greatingMessage: String
//if isJason {
//    greatingMessage = "Hello Jason"
//} else {
//    greatingMessage = "Hello Somebody"
//}
//print("Msg: \(greatingMessage)")

let greatingMessage: String = isJason ? "Hello Jason" : "Hello Somebody"
print("Msg: \(greatingMessage)")


// --- Scope

func hello() {
    var hours = 50
    let payPerHour = 10000
    var salary = 0

    if hours > 40 {
        let extraHours = hours - 40
        salary += extraHours * payPerHour * 2
        hours -= extraHours
    }

    salary += hours * payPerHour

    //print(extraHours)
    print(hours)
}

hello()

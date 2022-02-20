import UIKit

func printName() {
    print("---> My name is Jason")
}

printName()

// param 1개
// 숫자를 받아서 10을 곱해서 출력한다.
func printMultipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}

printMultipleOfTen(value: 5)

// param 2개
// 물건 값과 갯수를 받아서 전체 금액을 출력하는 함수
func printTotalPrice(price: Int, count: Int) {
    print("Total Price: \(price * count)")
}

printTotalPrice(price: 1500, count: 5)
printTotalPrice(price: 1500, count: 10)
printTotalPrice(price: 1500, count: 7)
printTotalPrice(price: 1500, count: 1)

//func printTotalPrice(가격 price: Int, 갯수 count: Int) {
//    print("Total Price: \(price * count)")
//}
//
//printTotalPrice(가격: 1500, 갯수: 5)

func printTotalPriceDefaultValue(price: Int = 1500, count: Int) {
    print("Total Price: \(price * count)")
}

printTotalPriceDefaultValue(count: 5)
printTotalPriceDefaultValue(count: 10)
printTotalPriceDefaultValue(count: 7)
printTotalPriceDefaultValue(count: 1)

printTotalPriceDefaultValue(price: 2000, count: 1)

func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}

let calculatedPrice = totalPrice(price: 10000, count: 77)
calculatedPrice

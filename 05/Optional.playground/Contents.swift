import UIKit

var carName: String?
carName = nil
carName = "Tesla"


// 아주 간단한 과제
// 1. 여러분이 최애하는 영화배우의 이름을 담는 변수를 작성해주세요. (타입 String?)
var favoriteMovieStar: String? = nil

// 2. let num = Int("10") 의 타입은 뭘까요?
let num = Int("10")


// 고급 기능 4가지
// Forced unwrapping > 억지로 박스를 까보기
//carName = nil
print(carName!)

// Optional binding (if let) > 부드럽게 박스를 까보자 1
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name 없다.")
}

func printParsedInt(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else {
        print("Int로 컨버팅 안된다 짜샤. ")
    }
}
printParsedInt(from: "100")
printParsedInt(from: "Hello")

// Optional binding (guard) > 부드럽게 박스를 까보자 2
func printParsedInt2(from: String) {
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 안된다 짜샤. ")
        return
    }
    
    print(parsedInt)
}
printParsedInt2(from: "100")
printParsedInt2(from: "Hello")

// Nil coalescing > 박스를 까봤더니, 값이 없으면 디폴트 값을 줘보자
let myCarName: String = carName ?? "Model S"

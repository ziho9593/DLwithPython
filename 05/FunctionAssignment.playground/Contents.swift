import UIKit

// 1. 성, 이름을 받아서 fullname을 출력하는 함수 만들기
func printFullname(first: String, last: String) {
    print("풀네임은 \(first + last)입니다.")
}
printFullname(first: "한", last: "지호")

// 2. 1번에서 만든 함수인데, 파라미터 이름을 제거하고 fullname을 출력하는 함수 만들기
func printFullnameNoParam(_ first: String, _ last: String) {
    print("풀네임은 \(first + last)입니다.")
}
printFullnameNoParam("한", "지호")

// 3. 성, 이름을 받아서 fullname을 return하는 함수 만들기
func returnFullname(first: String, last: String) -> String {
    return "\(first + last)"
}
let name = returnFullname(first: "한", last: "지호")
name

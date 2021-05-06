import UIKit
import Foundation

// ---- While

//while 조건 {
//    code ....
//}

//var i = 0
//while i < 10 {
//    print(i)
//    i += 1
//}

print("--- While")
var i = 10
while i < 10 {
    print(i)
//    if i == 5 {
//        break
//    }
    i += 1
}

print("--- Repeat")
i = 10
repeat {
    print(i)
    i += 1
} while i < 10

//while
//조건 > 코드 수행 > 조건 > 고드 수행
//
//repeat while
//코드 수행 > 조건 > 코드 수행 > 조건


// ---- For loop

let closedRangee = 0...10
let halfClosedRange = 0..<10

var sum = 0
for i in halfClosedRange {
    print("---> \(i)")
    sum += i
}

print("---> total sum: \(sum)")

var sinValue: CGFloat = 0
for i in closedRangee {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}

let name = "Jason"
for _ in closedRangee {
    print("--> name: \(name)")
}

for i in closedRangee {
    if i % 2 == 0 {
        print("---> 짝수: \(i)")
    }
}

for i in closedRangee where i % 2 == 0 {
    print("---> 짝수: \(i)")
}

for i in closedRangee {
    if i == 3 {
        continue
    }
    print("---> \(i)")
}

for i in halfClosedRange {
    for j in halfClosedRange {
        print("gugu --> \(i) * \(j) = \(i * j)")
    }
}

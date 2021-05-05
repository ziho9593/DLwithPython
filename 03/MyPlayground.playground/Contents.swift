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

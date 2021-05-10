import UIKit

var evenNumbers: [Int] = [2, 4, 6, 8]
//var evenNumbers: Array<Int> = [2, 4, 6, 8]

evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])

//evenNumbers = []
let isEmpty = evenNumbers.isEmpty

evenNumbers.count

print(evenNumbers.first)

let firstItem = evenNumbers.first

if let firstElement = evenNumbers.first {
    print("--> first item is : \(firstElement)")
}

evenNumbers.min()
evenNumbers.max()

evenNumbers[0]
var secondItem = evenNumbers[1]
var lastItem = evenNumbers[9]

//var twentithItem = evenNumbers[19] -> Index out of range


let firstThree = evenNumbers[0...2]

evenNumbers.contains(3)
evenNumbers.contains(4)

evenNumbers.insert(0, at: 0)
evenNumbers

//evenNumbers.removeAll()
evenNumbers.remove(at: 0)
evenNumbers

evenNumbers[0] = -2
evenNumbers

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers

evenNumbers.swapAt(0, 9)

for num in evenNumbers {
    print(num)
}

for (idx, num) in evenNumbers.enumerated() {
    print("idx: \(idx), value: \(num)")
}

evenNumbers.dropFirst(3)
evenNumbers
let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved
let lastRemoved = evenNumbers.dropLast()
lastRemoved
let first3 = evenNumbers.prefix(3)
first3

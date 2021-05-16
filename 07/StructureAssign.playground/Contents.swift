import UIKit

// 도전과제
// 1. 강의 이름, 강사 이름, 학생 수를 가지는 Struct 만들기 (Lecture)
struct Lecture {
    let name: String
    let instructor: String
    let numOfStudent: Int
}


// 2. 강의 array와 강사 이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
func printLectureName(from instructor: String, lectures: [Lecture]) {
    var lectureName = ""

    for lecture in lectures {
        if instructor == lecture.instructor {
            lectureName = lecture.name
        }
    }
    
//    let lectureName = lectures.first { $0.instructor == instructor}?.name ?? ""
    print("아 그 강사님 강의는요: \(lectureName)")
}


// 3. 강의 3개 만들고 강사 이름으로 강의 찾기
let lecture1 = Lecture(name: "iOS Basic", instructor: "Jason", numOfStudent: 5)
let lecture2 = Lecture(name: "iOS Advanced", instructor: "Jack", numOfStudent: 5)
let lecture3 = Lecture(name: "iOS Pro", instructor: "Jim", numOfStudent: 5)
let lectures = [lecture1, lecture2, lecture3]

printLectureName(from: "Jack", lectures: lectures)
printLectureName(from: "Lily", lectures: lectures)
printLectureName(from: "Jim", lectures: lectures)

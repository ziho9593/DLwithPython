import UIKit

var scoreDict: [String: Int] = ["Jason": 80, "Jay": 95, "Jake": 90]
//var scoreDict: Dictionary<String, Int> = ["Jason": 80, "Jay": 95, "Jake": 90]

if let score = scoreDict["Jason"] {
    score
} else {
    //.. score 없음
}

scoreDict["Jay"]
scoreDict["Jerry"]

//scoreDict = [:]
scoreDict.isEmpty
scoreDict.count

scoreDict["Jason"] = 99
scoreDict

scoreDict["Jack"] = 100
scoreDict

scoreDict["Jack"] = nil
scoreDict

for (name, score) in scoreDict {
    print("\(name), \(score)")
}

for key in scoreDict.keys {
    print(key)
}


// 1. 이름, 직업, 도시에 대해서 본인의 딕셔너리 만들기
var myDict: [String: String] = ["이름": "한지호", "직업": "조교", "도시": "수원"]

// 2. 도시를 부산으로 업데이트
myDict["도시"] = "부산"
myDict

// 3. 딕셔너리를 받아서 이름과 도시를 프린트 하는 함수 만들기
func printNameAndCity(dic: [String: String]) {
    if let name = dic["이름"], let city = dic["도시"] {
        print(name, city)
    } else {
        print("--> Cannot find")
    }
}

printNameAndCity(dic: myDict)

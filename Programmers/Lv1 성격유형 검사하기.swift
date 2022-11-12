import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let surveys = survey
    let choice = choices
    var types = ["R","T","C","F","J","M","A","N"]
    var dict:[String:Int] = [:]
    var result = ""
    for i in 0..<8 { dict[types[i]] = 0 }
    
    for i in 0..<surveys.count {
        if choice[i] == 4 {
            continue
        } else if choice[i] <= 3 {
            var temp = String(surveys[i].prefix(1))
            dict[temp]! += (4 - choice[i])
        } else {
            var temp = String(surveys[i].suffix(1))
            dict[temp]! += (choice[i] - 4)
        }
    }
    
    for i in 0..<4 {
        if dict[types[2*i]]! >= dict[types[2*i+1]]! { result += types[2*i] }
        else { result += types[2*i+1] }
    }
    
    return result
}

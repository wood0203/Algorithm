import Foundation

let n = Int(readLine()!)!
for _ in 0..<n {
    let languages = readLine()!.split(separator: "R", omittingEmptySubsequences: false)
    let length = Int(readLine()!)!
    var numbers = readLine()!.components(separatedBy: [",", "[", "]"]).filter { $0 != "" }
    
    var stopper = false
    for i in 0..<languages.count {
        if numbers.count < languages[i].count {
            stopper = true
            break
        }
//        매번 배열을 뒤집도록 해서 시간초과가 생겼다
//        numbers = numbers.reversed()
        for _ in 0..<languages[i].count { numbers.removeLast() }
    }
    
    stopper ? print("error") : print(Array(numbers.map{ Int($0)! }.reversed()))
}

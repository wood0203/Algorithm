import Foundation

let cnt = Int(readLine()!)!
var dict: [Int: [String]] = [:]
for _ in 0..<cnt {
    let input = readLine()!.components(separatedBy: " ")
    dict[Int(input[0])!] = [input[1], input[2]]
}
let current = Int(readLine()!)!

var result = current
for i in 0..<dict.count {
    var temp = dict[result]!
    if temp[0] == "L" { result -= Int(temp[1])!}
    else {result += Int(temp[1])!}
}

print(result)

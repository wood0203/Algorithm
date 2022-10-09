import Foundation

let n = Int(readLine()!)!
let num_lst = readLine()!.components(separatedBy: " ").map({Int($0)!})
let m = Int(readLine()!)!
var d = Array(repeating: 0, count: n+1)
for i in 1...n { d[i] = num_lst[i-1]+d[i-1] }
for _ in 0..<m {
    let input = readLine()!.components(separatedBy: " ").map({Int($0)!})
    print(d[input[1]]-d[input[0]-1])
}

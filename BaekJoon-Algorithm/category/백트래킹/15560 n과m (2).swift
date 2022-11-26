import Foundation

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let (n, m) = (nm[0], nm[1])
var arr = Array(repeating: 0, count: n)
var result:[String] = []

for i in 0..<n { arr[i] = i+1 }

func Combination(_ idx:Int, _ now:[Int]) {
    if now.count == m {
        result.append(now.map({String($0)}).joined(separator: " "))
        return
    }
    
    for i in idx..<n {
        Combination(i+1, now + [arr[i]])
    }
}

Combination(0, [])
for seq in result { print(seq) }

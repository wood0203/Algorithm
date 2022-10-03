import Foundation

let n = Int(readLine()!)!
var use = readLine()!.components(separatedBy: " ").map({Int($0)!})
var gain = readLine()!.components(separatedBy: " ").map({Int($0)!})
use.insert(0, at: 0)
gain.insert(0, at: 0)
var life = 100
var answer = 0
var d = Array(repeating: Array(repeating: 0, count: 100), count:n+1)

for i in 1..<use.count {
    for j in 0..<100 {
        if use[i] <= j {
            if gain[i] + d[i-1][j-use[i]] > d[i-1][j] {
                d[i][j] = gain[i] + d[i-1][j-use[i]]
            } else {
                d[i][j] = d[i-1][j]
            }
        } else {
            d[i][j] = d[i-1][j]
        }
    }
    answer = max(d[i][99], answer)
}

print(answer)

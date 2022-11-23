import Foundation

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let (n, m) = (nm[0], nm[1])
var Set1 = Set<String>()
for i in 0..<n {
    Set1.insert(readLine()!)
}

var cnt = 0
for i in 0..<m {
    if Set1.contains(readLine()!) { cnt += 1 }
}

print(cnt)

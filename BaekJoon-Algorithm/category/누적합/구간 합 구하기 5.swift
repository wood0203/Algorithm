import Foundation

let nm = readLine()!.components(separatedBy: " ").map({Int($0)!})
let (n,m) = (nm[0], nm[1])
var num_lst:[[Int]] = Array(repeating: [], count: n+1)
var d:[[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
for i in 1...n {
    num_lst[i] = [0] + (readLine()!.components(separatedBy: " ").map({Int($0)!}))
}

for i in 1...n {
    for j in 1...n {
        d[i][j] = num_lst[i][j] + d[i-1][j] + d[i][j-1] - d[i-1][j-1]
    }
}

// 100만
for _ in 0..<m {
    let xy = readLine()!.components(separatedBy: " ").map({Int($0)!})
    var x1 = xy[0]; var y1 = xy[1]; var x2 = xy[2]; var y2 = xy[3]
    print(d[x2][y2] - d[x2][y1-1] - d[x1-1][y2] + d[x1-1][y1-1])
}

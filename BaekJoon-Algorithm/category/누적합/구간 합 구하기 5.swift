import Foundation

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let (n,m) = (nm[0], nm[1])
var arr:[[Int]] = []
var prefix_sum = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
for i in 0..<n {
    var temp = readLine()!.split(separator: " ").map({Int($0)!})
    arr.append(temp)
}

for i in 1..<n+1 {
    for j in 1..<n+1 {
        prefix_sum[i][j] = arr[i-1][j-1] + prefix_sum[i-1][j] + prefix_sum[i][j-1] - prefix_sum[i-1][j-1]
    }
}

for j in 0..<m {
    let xy = readLine()!.split(separator: " ").map({Int($0)!})
    let (x1,y1,x2,y2) = (xy[0],xy[1],xy[2],xy[3])
    var answer = prefix_sum[x2][y2] - prefix_sum[x2][y1-1] - prefix_sum[x1-1][y2] + prefix_sum[x1-1][y1-1]
    print(answer)
}

import Foundation

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let (n,m) = (nm[0], nm[1])
var graph = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
var queue:[Int] = []
var visited = Array(repeating: false, count: n+1)
var cnt = 0

for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map({Int($0)!})
    let (x, y) = (xy[0], xy[1])
    graph[x][y] = 1; graph[y][x] = 1;
}

for node in 1...n {
    if !visited[node] {
        queue.append(node)
        visited[node] = true
        while !queue.isEmpty {
            var x = queue.removeFirst()
            for i in 0..<graph[x].count {
                if !visited[i] && graph[x][i] == 1 {
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
        cnt += 1
    }
}

print(cnt)

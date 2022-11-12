import Foundation

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let (n, m) = (nm[0], nm[1])
var sea:[[Int]] = []
var visited:[[Bool]] = []
var queue:[[Int]] = []
var move_x = [-1,1,0,0]; var move_y = [0,0,-1,1]
var answer = 0; var cnt = 0; var temp = 0

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map({Int($0)!})
    sea.append(row)
}

while cnt < 2 && Check() {
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    cnt = 0
    for i in 1..<n-1 {
        for j in 1..<m-1 {
            if sea[i][j] != 0 && !visited[i][j] {
                visited[i][j] = true
                queue.append([i,j])
                bfs(i,j)
                cnt += 1
            }
        }
    }
    answer += 1
}

cnt <= 1 ? print(0) : print(answer-1)

func Check() -> Bool {
    for i in 1..<n-1 {
        for j in 1..<m-1 {
            if sea[i][j] != 0 { return true }
        }
    }
    return false
}

func bfs(_ i:Int, _ j:Int) {
    while !queue.isEmpty {
        let xy = queue.removeFirst()
        let (x, y) = (xy[0], xy[1])
        visited[x][y] = true
        for i in 0..<4 {
            var dx = x + move_x[i]
            var dy = y + move_y[i]
            if (0..<n).contains(dx) && (0..<m).contains(dy) {
                if sea[dx][dy] == 0 && !visited[dx][dy] {
                    if sea[x][y] > 0 { sea[x][y] -= 1 }
                    else { sea[x][y] = 0 }
                }
                if sea[dx][dy] > 0 && !visited[dx][dy] {
                    // 0보다 크고 방문 안 했을때
                    // 0이면서 방문 했을 때, 0보다 크고 방문 했을 때는 필요없음.
                    queue.append([dx,dy])
                    visited[dx][dy] = true
                }
            }
        }
    }
}

import Foundation

let n = Int(readLine()!)!
var colors:[[Character]] = []
var moves = [[-1,0], [1,0], [0,-1], [0,1]]
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
for _ in 0..<n { colors.append(Array(readLine()!)) }

func bfs(_ blinded: Bool) -> Int {
    var cnt = 0
    var queue:[[Int]] = []
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] {
                queue.append([i,j])
                cnt += 1
            }
            while !queue.isEmpty {
                var node = queue.removeFirst()
                var (x, y) = (node[0], node[1])
                var color = colors[x][y]
                for k in 0...3 {
                    var dx = x + moves[k][0]
                    var dy = y + moves[k][1]
                    if 0 <= dx && dx < n && 0 <= dy && dy < n {
                        if !visited[dx][dy] {
                            if !blinded {
                                if colors[dx][dy] == color {
                                    visited[dx][dy] = true
                                    queue.append([dx,dy])
                                }
                            } else {
                                if color != colors[dx][dy] {
                                    if (color == "R" && colors[dx][dy] == "G") || (color == "G" && colors[dx][dy] == "R") {
                                        visited[dx][dy] = true
                                        queue.append([dx,dy])
                                    }
                                } else {
                                    visited[dx][dy] = true
                                    queue.append([dx,dy]) }
                            }}}}}}}
    
    return cnt
}

print(bfs(false), bfs(true))




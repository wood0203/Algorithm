import Foundation

let move_x = [-1,1,0,0,-1,-1,1,1]
let move_y = [0,0,-1,1,-1,1,-1,1]

while true {
    let wh = readLine()!.split(separator: " ").map({Int($0)!})
    if wh == [0, 0] { break }
    let (w, h) = (wh[0], wh[1])
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var graph:[[Int]] = []
    var queue:[[Int]] = []
    var cnt = 0
    for _ in 0..<h {
        let temp = readLine()!.split(separator: " ").map({Int($0)!})
        graph.append(temp)
    }
    
    for i in 0..<h {
        for j in 0..<w {
            if graph[i][j] == 1 && !visited[i][j] {
                queue.append([i,j])
                dfs(i, j)
                cnt += 1
            }
        }
    }
    
    print(cnt)
    
    func dfs(_ x:Int, _ y:Int) {
        visited[x][y] = true
        while !queue.isEmpty {
            let ab = queue.removeFirst()
            let (a, b) = (ab[0], ab[1])
            for i in 0..<8 {
                let da = a + move_x[i]
                let db = b + move_y[i]
                if (0..<h).contains(da) && (0..<w).contains(db) {
                    if graph[da][db] == 1 && !visited[da][db] {
                        visited[da][db] = true
                        queue.append([da,db])
                    }
                }
            }
        }
        
        return
    }
}

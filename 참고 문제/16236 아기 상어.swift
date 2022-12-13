import Foundation

let n = Int(readLine()!)!
var space:[[Int]] = []
var queue:[[Int]] = []
var d:[[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var move = [[-1,0], [1,0], [0,-1], [0,1]]
var shark = [0,0]
var level = 2
var cnt = level
var fish = [n-1,n-1]
var answer = 0; var temp = 0
var min_dist = 402

for i in 0..<n {
    var temp = readLine()!.split(separator: " ").map({ (element:Substring) -> Int in
        var e = Int(element)!
        return e })

    if temp.contains(9) {
        var idx = temp.firstIndex(of: 9)!
        shark[0] = i; shark[1] = idx
    }
    space.append(temp)
}

repeat {
    temp = answer
    answer += bfs(shark[0], shark[1])
} while temp != answer

print(answer)

func bfs(_ i:Int, _ j:Int) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var fishes:[[Int]] = []
    var min_dist = 402
    queue.append([i,j])
    space[shark[0]][shark[1]] = 0
    visited[i][j] = true
    d[i][j] = 0
    while !queue.isEmpty {
        let xy = queue.removeFirst()
        let (x, y) = (xy[0], xy[1])
        for i in 0...3 {
            var dx = x + move[i][0]
            var dy = y + move[i][1]
            if 0 <= dx && dx < n && 0 <= dy && dy < n && space[dx][dy] <= level && !visited[dx][dy] {
                d[dx][dy] = d[x][y] + 1
                visited[dx][dy] = true
                queue.append([dx,dy])
                if 1 <= space[dx][dy] && space[dx][dy] < level {
                    if d[dx][dy] <= min_dist {
                        min_dist = min(min_dist, d[dx][dy])
                        fishes.append([dx,dy])
                    }
                }
            }
        }
    }
    
    // *가능한 물고기들을 모두 모아서 정렬.
    // *클로저를 기깔나게 사용함. 클로저 연습을 계속 해야한다. by를 사용하지 않을때는 그냥 { $0, $1을 사용}
    // *정렬에서 클로저 a<b는 작은걸 왼쪽에 둔다는 의미!! 내림차순은 반대로니까 잘 생각해야함.
    fishes.sort {
        if $0[0] == $1[0] {
            return $0[1] < $1[1] }
        return $0[0] < $1[0]
    }
    
    if !fishes.isEmpty {
        let (a, b) = (fishes[0][0], fishes[0][1])
        print(a, b, min_dist)
        space[a][b] = 0
        shark[0] = a
        shark[1] = b
        if cnt == 1 {
            level += 1
            cnt = level
        } else { cnt -= 1 }
    }
    
    if min_dist == 402 {return 0}
    else {return min_dist}
}


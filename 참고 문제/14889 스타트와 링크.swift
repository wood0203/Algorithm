import Foundation

let n = Int(readLine()!)!
var stats:[[Int]] = []
var visited = Array(repeating:false, count:n)
var answer = Int.max

for i in 0..<n {
    stats.append(readLine()!.split(separator:" ").map({Int($0)!}))
}

solution(0)
print(answer)

func solution(_ depth:Int) {
    if depth == n/2 {
        var team1 = 0
        var team2 = 0
        for i in 0..<n {
            for j in 0..<n {
                if !visited[i] && !visited[j] {
                    team2 += stats[i][j]
                }
                if visited[i] && visited[j] {
                    team1 += stats[i][j]
                }
            }
        }
        
        answer = min(answer, abs(team1 - team2))
        
        return
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            solution(depth + 1)
            visited[i] = false
        }
    }
}

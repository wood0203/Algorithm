import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result: Int = 0
    var visited = [Int](repeating:0, count:n)
    var queue:[Int] = []
    
    func dfs(idx: Int) {
        for j in 0..<n {
            if idx == j {continue }
            if computers[idx][j] == 1 && visited[j] == 0 {
                queue.append(j)
                visited[j] = 1
                dfs(idx: j)
            }
        }
        
        queue.removeLast()
        // 처음에 removefirst를 사용해서 오류.
        // 오류 이유: 아직 탐색을 실시하지 않은 노드가 삭제되었으므로.
    }
    
    for i in 0..<computers.count {
        if visited[i] == 0 {
            result += 1
            queue.append(i)
            visited[i] = 1
            dfs(idx: i)
        }
    }
    
    // print(visited)
    return result
}


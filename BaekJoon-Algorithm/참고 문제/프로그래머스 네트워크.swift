import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted {
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] < $1[0]
    }
    var visited = Array(repeating:false, count:tickets.count)
    var result:[String] = []
    
    func dfs(_ depart:String) {
        
        // 마지막에는 depart에 해당하는곳이 tickets 내에 없으므로 이렇게 끝내줌.
        if result.count == tickets.count {
            result.append(depart)
            return
        }
        
        for i in 0..<tickets.count {
            if tickets[i][0] == depart && !visited[i] {
                visited[i] = true
                result.append(depart)
                dfs(tickets[i][1])
                
                if result.count == tickets.count + 1 {
                    return
                }
                
                // cnt 변수를 1씩 추가하기 보다 result의 길이를 이용하면 쉽게 탈출할 수 있다.
                // count 메소드는 시간복잡도 n이 아니라 1이므로 마음껏 사용해도 무관하다.
                visited[i] = false
                result.removeLast()
            }
        }
    }
    
    dfs("ICN")
    
    return result
}

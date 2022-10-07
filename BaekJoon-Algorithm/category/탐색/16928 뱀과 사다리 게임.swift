import Foundation

// 사다리를 모두 사용했을때 ~ 하나도 안사용했을 때로 생각
// 모든 경우의수인 이항분포를 생각함. n=15 -> 2**15 * 100 -> 1초 계산가능
// 브루트포스 외 다른 방안이 있는지 좀더 고민.

let nums = readLine()!.components(separatedBy: " ").map({ Int($0)! })
var d = Array(repeating: 0, count: 101)
var visited = Array(repeating: false, count:101)
var ladders:[Int:Int] = [:]
var queue:[Int] = []
var answer = 99
for i in 0..<(nums[0]+nums[1]) {
    let xy = readLine()!.components(separatedBy: " ").map({ Int($0)! })
    ladders[xy[0]] = xy[1]
}

d[100] = 99
queue.append(1)
while !queue.isEmpty {
    var x = queue.removeFirst()
    for i in 1...6 {
        if let idx = ladders[x+i] {
            if visited[idx] == false {
                d[idx] = d[x]+1
                queue.append(idx)
                visited[idx] = true
            }
        } else {
            if x+i <= 100 && !visited[x+i] {
                d[x+i] = d[x]+1
                queue.append(x+i)
                visited[x+i] = true
            }
        }
        answer = d[100] < answer ? d[100]:answer
    }
}

print(answer)

// 큐를 처음 마지막을 pop했는데 그렇게 됬을때 생기는 문제는
// 아직 탐색을 하지못한 노드가 삭제되므로 문제가 생긴다.
// removeFirst가 가장 중요함.

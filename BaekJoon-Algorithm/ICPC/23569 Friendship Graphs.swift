import Foundation

public var queue:[Int] = []
let input = readLine()!.components(separatedBy: " ")
let n = Int(input[0])!
let m = Int(input[1])!
var visited = Array(repeating: true, count: n)
var result = 502

// 후행 클로저를 통한 인접행렬 초기화
var graph = Array(repeating: [], count: n+1)

// 수 입력받기
for _ in 0..<m {
    let vertices = readLine()!.components(separatedBy: " ")
    graph[Int(vertices[0])!].append(Int(vertices[1])!)
    graph[Int(vertices[1])!].append(Int(vertices[0])!) }

// bfs 실행
// 시간복잡도 : 1/2*(1000^2) = 50만
for num in 0..<n {
    queue = []
    queue.append(num)
    while !queue.isEmpty {
        var a = queue.removeFirst()
        for i in 0..<graph[a].count {
            var temp = graph[a][i] as! Int
            if !visited[temp] {
                visited[temp] = true
                queue.append(temp)
            }
        }
        if Check() {
            
        }
    }
}

// 연결되어있는지 확인하는 함수
// bfs도중 매번 확인을 하면 1억/50만이므로 탐색 한번당 200번만 확인해야됨..
// 다른 방도를 모색해보자
func Check() -> Bool {
    for node in queue {
        
    }

    return true
}

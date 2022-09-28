import Foundation

public var queueA:[Int] = []
public var queueB:[Int] = []
let input = readLine()!.components(separatedBy: " ")
let n = Int(input[0])!
let m = Int(input[1])!
var visited:[[Int]] = []
visited.append(Array(repeating: Array(repeating:0, count: n), count: n))
var result = 502

// 후행 클로저를 통한 인접행렬 초기화
var graph = Array(repeating: [], count: n+1)

// 인접리스트를 사용 : Check func에서 시간을 줄이기위해
for _ in 0..<m {
    let vertices = readLine()!.components(separatedBy: " ")
    graph[Int(vertices[0])!][Int(vertices[1])!] = 1
    graph[Int(vertices[1])!][Int(vertices[0])!] = 1 }

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
func Check(main_node: Int) -> Bool {
    for node in queue {
        if graph[node][main_node] != 1 {
            
        }
    }

    return true
}

// 여담 : 문제의 간선의 개수가 왜 Combination(n,2)일까?
//1번 노드의 최대 간선수: 5
//2번: 4
//3번: 3 ... 1씩 줄어들고 최종적으로 마지막 노드는 간선을 가질수 없게 된다.
//결국 : n개의 노드에서 최대간선 수는 ((n-1)*n)/2인데, 이는 Combination(n,2)와 같으므로
//n개의 노드에서 최대 간선수는 Combination(n,2)이다.

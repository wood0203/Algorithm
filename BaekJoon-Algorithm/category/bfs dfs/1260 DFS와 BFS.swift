import Foundation

final class Queue {
    var values: [Int?]
    var index: Int
    var count: Int {
        return self.values.count
    }
    var isEmpty: Bool {
        return self.values.isEmpty
    }
    
    init() {
        self.values = []
        self.index = 0
    }
    
    func push(value: Int) {
        self.values.append(value)
    }
    
    func pop() -> Int? {
        guard 0 < self.count && self.index < self.count else {
            return nil
        }
        
        let poppedValue = self.values[self.index]
        self.values[self.index] = nil
        self.index += 1
        return poppedValue
    }
}

var graph: [[Int]] = [[]]
var visited: [Bool] = []

func solution() {
    let nmv = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m, v) = (nmv[0], nmv[1], nmv[2])
    graph = Array(
        repeating: Array(repeating: 0, count: n),
        count: n
    )
    visited = Array(repeating: false, count: n)

    for _ in 0..<m {
        let v12 = readLine()!.split(separator: " ").map { Int($0)! }
        let (v1, v2) = (v12[0] - 1, v12[1] - 1)
        graph[v1][v2] = 1
        graph[v2][v1] = 1
    }
    
    dfs(node: v)
    visited = Array(repeating: false, count: n)
    bfs(node: v)
    print("")
}

func dfs(node: Int) {
    print("\(node)", terminator: " ")
    visited[node - 1] = true
    
    for index in 0..<graph[node - 1].count {
        if graph[node - 1][index] == 1 && visited[index] == false {
            visited[index] = true
            dfs(node: index + 1)
        }
    }
}

func bfs(node: Int) {
    print("")
    let queue = Queue()
    queue.push(value: node - 1)
    visited[node - 1] = true

    while queue.isEmpty == false {
        guard let popped = queue.pop() else {
            return
        }

        print("\(popped + 1)", terminator: " ")
        for index in 0..<graph[popped].count {
            if graph[popped][index] == 1 && visited[index] == false {
                queue.push(value: index)
                visited[index] = true
            }
        }
    }
}

solution()

import Foundation

//5
//6 8 2 6 2
//3 2 3 4 6
//6 7 3 3 2
//7 2 5 3 6
//8 9 5 2 7

class Queue {
    var queue: [(Int, Int)?]
    var head: Int
    var count: Int {
        return queue.count
    }
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    init(queue: [(Int, Int)?]) {
        self.queue = queue
        self.head = 0
    }

    func enque(element: (Int, Int)) {
        self.queue.append(element)
    }

    func deque() -> (Int, Int)? {
        guard self.head < self.count else {
            return nil
        }

        let element = self.queue[self.head]
        self.queue[self.head] = nil
        self.head += 1
        return element
    }
}

func solution() -> Int {
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        locations.append(row)
    }
    
    var maximumRain = -1
    locations.forEach { (location: [Int]) in
        maximumRain = max(maximumRain, location.max()!)
    }

    var answer = 1
    for rain in 0..<maximumRain {
        visited = Array(
            repeating: Array(
                repeating: false,
                count: n
            ),
            count: n
        )
        var safeAreaCount = 0
        for i in 0..<n {
            for j in 0..<n {
                if locations[i][j] > rain && visited[i][j] == false {
                    queue.enque(element: (i, j))
                    bfs(x: i, y: j, rain: rain)
                    safeAreaCount += 1
                }
            }
        }
        answer = max(answer, safeAreaCount)
    }
    
    return answer
}

func bfs(x: Int, y: Int, rain: Int) {
    while queue.isEmpty == false {
        guard let (x, y) = queue.deque() else {
            return
        }
        
        for i in 0..<4 {
            let dx = x + moveX[i]
            let dy = y + moveY[i]
            if  limitRange.contains(dx) == true &&
                limitRange.contains(dy) == true &&
                visited[dx][dy] == false &&
                locations[dx][dy] > rain
            {
                queue.enque(element: (dx, dy))
                visited[dx][dy] = true
            }
        }
    }
}

var locations: [[Int]] = []
var visited: [[Bool]] = []
var queue = Queue(queue: [])
var answer = 0
var moveX = [-1, 1, 0, 0]
var moveY = [0, 0, -1, 1]
let n = Int(readLine()!)!
let limitRange = (0..<n)

print(solution())

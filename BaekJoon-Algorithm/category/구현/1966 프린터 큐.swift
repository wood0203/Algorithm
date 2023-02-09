import Foundation

//3
//1 0
//5
//4 2
//1 2 3 4
//6 0
//1 1 9 1 1 1

let testNum = Int(readLine()!)!
for _ in 0..<testNum {
    let nm = readLine()!.split(separator: " ").map{ Int($0)! }
    let loc = nm[1]
    var queue = readLine()!.split(separator: " ").map{ [Int($0)!, 0] }
    queue[loc][1] = 1
    var maxPriority = -1
    var cnt = 0
    queue.forEach { maxPriority = max(maxPriority, $0[0]) }
    
    while true {
        if queue[0][0] == maxPriority {
            cnt += 1
            if queue[0][1] == 1 {
                print(cnt)
                break
            }
            queue.removeFirst()
            maxPriority = resetmax(queue)
        }
        else {
            queue.append(queue.removeFirst())
        }
    }
}

func resetmax(_ queue:[[Int]]) -> Int {
    var maximum = -1
    queue.forEach { maximum = max(maximum, $0[0]) }
    return maximum
}

import Foundation

let n = Int(readLine()!)!
let num = readLine()!.split(separator: " ").map({Int($0)!})
var visited = Array(repeating: false, count: n)
var answer = 0

solution([])
print(answer)

func solution(_ arr:[Int]) {
    if arr.count == n {
        var sum = 0
        for i in 1..<arr.count {
            sum += abs(arr[i-1] - arr[i])
        }
        print(arr, answer)
        answer = max(answer, sum)
        
        return
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            solution(arr + [num[i]])
            visited[i] = false
        }
    }
}

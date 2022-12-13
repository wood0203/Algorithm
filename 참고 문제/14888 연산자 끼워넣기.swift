import Foundation

typealias symbol = (Int, Int) -> (Int)

let n = Int(readLine()!)!
let num_arr = readLine()!.split(separator: " ").map({Int($0)!})
let symbol_cnt = readLine()!.split(separator: " ").map({Int($0)!})
var symbols:[Int] = []
var visited:[Bool] = []
var minimum = Int64.max
var maximum = Int64.min

for i in 0..<symbol_cnt.count { symbols += Array(repeating: i, count: symbol_cnt[i]) }
visited = Array(repeating: false, count: symbols.count)

func solution(_ arr:[Int]) {
    if arr.count == symbols.count {
        var result = Int64(num_arr[0])
        for i in 0..<arr.count {
            switch arr[i] {
            case 0: result += Int64(num_arr[i+1])
            case 1: result -= Int64(num_arr[i+1])
            case 2: result *= Int64(num_arr[i+1])
            default: result /= Int64(num_arr[i+1])
            }
        }
        
        maximum = max(result, maximum)
        minimum = min(result, minimum)
        
        return
    }

    for i in 0..<symbols.count {
        if !visited[i] {
            visited[i] = true
            solution(arr + [symbols[i]])
            visited[i] = false
        }
    }
}

solution([])
print(maximum)
print(minimum)

// 백트래킹의 기본은 완전탐색이다!! 완전탐색이면 사용해보려고 노력하자.
// 백트래킹 순서를 계속 까먹는다.
// 1. 방문할 노드들을 먼저 배열에 넣음.
// 2. visited가 필요한가? 이번 문제는 겹치지 않게 하기 위해서 써야했다. -> 순열 생각
// 재귀 / 스택으로 구현
// 많이 풀어봐야 알 수 있을 거 같다. 참고했으므로 여러번 보자


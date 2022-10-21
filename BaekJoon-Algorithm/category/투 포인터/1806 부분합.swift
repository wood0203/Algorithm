import Foundation

// 누적합으로 풀어야된다고 생각했지만 간단한 투포인터 문제였다.
// 일정 구간의 합을 구하라 -> 누적합 / 구간합의 최적의 해를 구하라 -> 투포인터

let ns = readLine()!.split(separator: " ").map({Int($0)!})
let (n,s) = (ns[0], ns[1])
let arr = readLine()!.split(separator: " ").map({Int($0)!})
var end = 0
var prefix_sum = 0
var cnt = 0
var result = Int.max // 정수 최대값
for start in 0..<n {
    while prefix_sum < s && end < n {
        prefix_sum += arr[end]
        end += 1
        cnt += 1
    }
    if prefix_sum >= s {
        result = min(cnt, result)
    }
    cnt -= 1
    prefix_sum -= arr[start]
}

result == Int.max ? print(0) : print(result)

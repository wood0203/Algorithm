import Foundation

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let (n, m) = (nm[0], nm[1])
var arr = Array(repeating: 0, count: n)
var result = ""

for i in 0..<n { arr[i] = i+1 }

func solution(_ idx:Int, _ now:[Int]) {
    if now.count == m {
        result += now.map({String($0)}).joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in idx..<n {
        solution(i, now + [arr[i]])
    }
}

solution(0, [])
print(result)

// result를 이차원 배열로 저장했을 때 시간이 초과되어 문제를 못 풀었었다.
// 문자열이 시간이 더 save된다는 점을 잘 활용해야한다.

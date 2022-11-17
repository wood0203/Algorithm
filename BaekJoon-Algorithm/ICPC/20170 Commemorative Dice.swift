import Foundation

//3 4 3 4 3 4
//1 1 1 1 8 9

let player1 = readLine()!.split(separator: " ").map({Int($0)!})
let player2 = readLine()!.split(separator: " ").map({Int($0)!})
var results:[Int] = []
var max_common = 0
var sum = 0

for i in 0..<6 {
    var cnt = 0
    for j in 0..<6 {
        if player1[i] > player2[j] {
            cnt += 1
        }
    }
    results.append(cnt)
}

sum = results.reduce(0, +)
gcd(sum, 36)
print("\(Int(sum/max_common))/\(Int(36/max_common))")

// 유클리드 호제법을 사용한 알고리즘. 한번 더 알아두면 좋을것 같다.
// 브루트포스를 사용했을 때 보다 좀더 시간을 단축시켰음. -> ICPC 채점 점수 증가 요소가 될 수 있다.

func gcd(_ a:Int, _ b: Int) {
    if b == 0 {
        max_common = a
        return
    }
    else { return gcd(b, a%b) }
}

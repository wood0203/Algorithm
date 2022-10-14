import Foundation

let nk = readLine()!.components(separatedBy: " ").map({Int($0)!})
let (n, k) = (nk[0], nk[1])
var arr:[Int] = readLine()!.components(separatedBy: " ").map({Int($0)!})
var d = Array(repeating: -101, count: n-k+1)

for i in 0...(n-k) {
    if i == 0 { d[0] = arr[0...k-1].reduce(0, {$0 + $1})}
    else { d[i] = d[i-1] + arr[i+k-1] - arr[i-1] }
}

print(d.max()!)

// 처음에 d를 arr과 똑같은 크기로 만들어서 초기화된 값때문에
// 문제를 틀렸다. 누적합때는 크기 조절 필수!

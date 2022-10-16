import Foundation

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let (n,m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map({Int(Int($0)!/3)})
// split 함수를 사용하면 components보다 성능이 더 좋음.
// components는 seperator 이후에 빈 배열은 return 하기 때문.
var prefix_sum = Array(repeating: 0, count: m)
var cnt = Array(repeating: 0, count: arr.count)

for i in 0..<arr.count {
    if i == 0 { prefix_sum[i] = arr[i] }
    else { prefix_sum[i] = arr[i] + prefix_sum[i-1] }
    cnt[prefix_sum[i] % m] += 1
}

var result = 0
for i in 0..<m {
    var n = (cnt[i] * (cnt[i]-1)) / 2
    result += n
}

print(result + cnt[0])

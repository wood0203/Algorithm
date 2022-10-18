import Foundation

// 시간제한 2초
// -1,000,000,000 ≤ T ≤ 1,000,000,000
// 1 ≤ n,m ≤ 1,000

let t = Int(readLine()!)!
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map({Int($0)!})
let m = Int(readLine()!)!
let b = readLine()!.split(separator: " ").map({Int($0)!})
var da = Array(repeating: 0, count: n+1); var db = Array(repeating: 0, count: m+1)
var dict_a:[Int:Int] = [:]; var dict_b:[Int:Int] = [:]

for i in 1..<n+1 {
    da[i] = a[i-1] + da[i-1]
    if let tmp = dict_a[da[i]] {dict_a[da[i]]! += 1}
    else {dict_a[da[i]] = 1}
}

for i in 1..<m+1 {
    db[i] = b[i-1] + db[i-1]
    if let tmp = dict_b[db[i]] {dict_b[db[i]]! += 1}
    else {dict_b[db[i]] = 1}

}

for i in 1..<n {
    for j in i+1..<n+1 {
        if let temp = dict_a[da[j] - da[i]] {dict_a[da[j]-da[i]]! += 1}
        else {dict_a[da[j]-da[i]] = 1}
    }
}

for i in 1..<m {
    for j in i+1..<m+1 {
        if let temp2 = dict_b[db[j] - db[i]] {dict_b[db[j]-db[i]]! += 1}
        else {dict_b[db[j]-db[i]] = 1}
    }
}

var result = 0
for key in dict_a.keys {
    guard let i = dict_b[t-key] else { continue }
    result += (dict_a[key]! * i)
}

print(result)

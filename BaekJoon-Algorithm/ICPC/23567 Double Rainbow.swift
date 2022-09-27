import Foundation

let input = readLine()!.components(separatedBy: " ")

let n = Int(input[0])!
let k = Int(input[1])!
var arr:[Int] = []
var dict_p:[Int:Int] = [:]
var dict_p1:[Int:Int] = [:]
var start:Int = 0
var end:Int = k-1
var result = 10001
for _ in 0..<n { arr.append(Int(readLine()!)!) }
for i in 1...k {
    dict_p[i] = 0
    dict_p1[i] = 0 }
for i in start..<n {
    if i <= end { dict_p1[arr[i]]! += 1 }
    else { dict_p[arr[i]]! += 1} }

while start <= end {
    if start >= n {break}
    if dict_p1.values.contains(0) {
        if end < n-1 {
            end += 1
            dict_p1[arr[end]]! += 1
            dict_p[arr[end]]! -= 1
        } else {
            dict_p1[arr[start]]! -= 1
            dict_p[arr[start]]! += 1
            start += 1
        }
    } else {
        if dict_p.values.contains(0) {
            dict_p1[arr[start]]! -= 1
            dict_p[arr[start]]! += 1
            start += 1
        } else {
            var temp = dict_p1.values.reduce(0, {$0+$1})
            if temp < result { result = temp }
            dict_p1[arr[start]]! -= 1
            dict_p[arr[start]]! += 1
            start += 1
        }
    }
}

if result != 10001 {print(result)}
else {print(0)}


// 처음 시도했던 투포인터 알고리즘 -> P1과 P의 리스트를 집합으로 만들어서 합을 통해
// double rainbow 성립하는지 확인.
// 답은 맞췄지만 시간복잡도 n*4n이므로 시간이 초과됨.
//while start <= end {
//var temp = arr
//if Set(arr[start...end]).reduce(0, {$0 + $1}) == (k*(k+1))/2 {
//    temp.removeSubrange(start...end)
//    if Set(temp).reduce(0, {$0 + $1}) == (k*(k+1))/2 {
//        result = temp.count < result ? temp.count : result
//        start += 1
//    } else {start += 1}
//} else {
//    if end < n-1 {end += 1}
//    else {start += 1}
//}
//
//}

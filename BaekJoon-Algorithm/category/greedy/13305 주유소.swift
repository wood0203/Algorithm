import Foundation

let n = Int(readLine()!)!
let distances = readLine()!.components(separatedBy: " ").map({ Int($0)! })
let prices = readLine()!.components(separatedBy: " ").map({ Int($0)! })
var answer = 0
var temp_price = prices[0]
var temp_dist = distances[0]

for i in 1..<prices.count {
    if i == n-1 {
        answer += temp_dist*temp_price
        break }
    if temp_price < prices[i] {
        temp_dist += distances[i]
    } else {
        answer += temp_dist*temp_price
        temp_price = prices[i]
        temp_dist = distances[i]
    }
}

print(answer)

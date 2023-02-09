import Foundation

let n = Int(readLine()!)!
var callnumbers:[Int] = []

for _ in 0..<n {
    let num = Int(readLine()!)!
    if num == 0 { callnumbers.removeLast() }
    else { callnumbers.append(num) }
}

print(callnumbers.reduce(0,+))

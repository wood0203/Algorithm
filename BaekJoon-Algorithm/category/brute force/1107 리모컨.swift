import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var errors:[Int] = []
if m != 0 { errors = readLine()!.split(separator: " ").map({Int($0)!}) }
var result = abs(n-100)

for i in 0..<999900 {
    var num = i
    var stopper = true
    var cnt = String(i).count
    for _ in 0..<cnt {
        var temp = num % 10
        if errors.contains(temp) {
            stopper = false
            break
        }
        num /= 10
    }
    
    if stopper { result = min(result , abs(n-i)+cnt) }
    else { continue }
}

print(result)

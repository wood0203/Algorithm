import Foundation

let n = Int(readLine()!)!
var stack:[Int] = []
var result:[String] = []
var depth = 0

for i in 0..<n {
    var stopper = false
    let input = Int(readLine()!)!
    if input > depth {
        stack.append(contentsOf: 1..<input)
        result.append(contentsOf: Array(repeating: "+", count: input) + ["-"])
        depth = input
    } else {
        while !stack.isEmpty {
            var a = stack.removeLast()
            if a == input {
                result.append("-")
                stopper = true
                break
            }
        }
    }
    
    if stopper {
        print("No")
        break
    }
}

for ans in result {
    print(ans)
}

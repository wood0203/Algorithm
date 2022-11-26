import Foundation

let nm = readLine()!.split(separator: " ").map({Int($0)!})
let (n, m) = (nm[0], nm[1])
var arr = Array(repeating: 0, count: n)
var result:[String] = []
var visited = Array(repeating:false, count:n)

for i in 0..<n { arr[i] = i+1 }

func Permutation(_ now:[Int]) {
    if now.count == m {
        result.append(now.map({String($0)}).joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        // 매우 중요함. 선언하지 않을 시, 순열에 같은수가 있을수도 있음.
        if visited[i] {
            continue
        } else {
            visited[i] = true
            Permutation(now + [arr[i]])
            visited[i] = false
        }
    }
}

Permutation([])
for seq in result { print(seq) }

import Foundation

let str = Array(readLine()!)
let q = Int(readLine()!)!
var d = Array(repeating: 0, count: str.count)

for i in 0..<q {
    let qlr = readLine()!.components(separatedBy: " ")
    let (a,l,r) = (Character(qlr[0]), Int(qlr[1])!, Int(qlr[2])!)
    if str[0] == a { d[0] = 1 } else { d[0] = 0 }
    for j in 1..<str.count {
        if str[j] == a { d[j] = d[j-1] + 1 } else { d[j] = d[j-1] }
    }
    if l==0 { print(d[r]) } else { print(d[r] - d[l-1]) }
}

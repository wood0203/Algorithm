import Foundation

let str = Array(readLine()!)
let q = Int(readLine()!)!
var length = str.count
var d = Array(repeating: Array(repeating: 0, count: length), count: 26)

for i in 0..<26 {
    var ch = Character(UnicodeScalar(97+i)!)
    if str[0] == ch { d[i][0] = 1 }
    for j in 1..<length {
        if str[j] == ch { d[i][j] = d[i][j-1] + 1 }
        else { d[i][j] = d[i][j-1] }
    }
}

for i in 0..<q {
    let qlr = readLine()!.components(separatedBy: " ")
    let (a,l,r) = (Int(UnicodeScalar(qlr[0])!.value), Int(qlr[1])!, Int(qlr[2])!)
    l == 0 ? print(d[a-97][r]) : print(d[a-97][r] - d[a-97][l-1])
}


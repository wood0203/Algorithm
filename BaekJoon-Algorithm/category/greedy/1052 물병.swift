import Foundation

let nk = readLine()!.split(separator: " ").map({Int($0)!})
let (n, k) = (nk[0], nk[1])
let binary = dec2bin(n)
var end = find_end(binary, k)
var start = binary.firstIndex(of: true)!
var answer:[Bool] = []

if end == -1 { print(0) }
else {
    for i in 0..<end {
        if i <= start { answer.append(binary[i]) }
        else { answer.append(!binary[i]) }
    }
    
    print(bin2dec(answer))
}

func find_end(_ bin:[Bool], _ k:Int) -> Int {
    var cnt = 0
    for i in (0..<bin.count).reversed() {
        if bin[i] == true { cnt += 1 }
        if cnt == k { return i }
    }

    return -1
}

func dec2bin(_ demical:Int) -> [Bool] {
    var result:[Bool] = []
    var num = demical

    while num != 0 {
        if num % 2 == 0 { result += [false] }
        else { result += [true] }
        num /= 2
    }

    return result
}

func bin2dec(_ bin:[Bool]) -> Int {
    var result = 0
    var bit_cnt = 1
    
    for i in 0..<bin.count {
        if bin[i] {
            result += bit_cnt
        }
        bit_cnt *= 2
    }
    
    return result
}

import Foundation

let cnt = Int(readLine()!)!
for _ in 0..<cnt {
    let input = readLine()!.split(separator: " ")
    var a = Double(input[0])!
    var b = Double(input[1])!
    var temp:[Double] = [a,b]
    var answer:[Double] = []
    var sum: Double
    if Int(b) % Int(a) == 0 {
        sum = b/a
        answer = [1.0,b/a]
    } else {
        sum = 1.0 / ceil(b/a)
        answer = [1.0, ceil(b/a)]
    }
    
    while sum != a/b {
        temp = fraction_sub(num1: temp, num2: answer)
        if temp[0] == 0 { break }
        answer = MakeHenry(fraction: temp)
        sum += 1.0/answer[1]
    }

    print(Int(answer[1]))
}

func MakeHenry(fraction: [Double]) -> [Double] {
    if Int(fraction[1]) % Int(fraction[0]) == 0 {
        return [1.0, (fraction[1]/fraction[0])]
    } else {
        return [1.0, ceil((Double(fraction[1])/Double(fraction[0])))]
    }
}

func fraction_sub(num1: [Double], num2:[Double]) -> [Double]{
    // 분수를 [분자,분모]로 입력받음.
    var numer = num1[0]*num2[1] - num1[1]*num2[0]
    var denom = num1[1]*num2[1]
    
    return [numer, denom]
}

//3
//4 23
//5 7
//8 11

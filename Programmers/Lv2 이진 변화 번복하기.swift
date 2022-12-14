import Foundation

func solution(_ s:String) -> [Int] {
    var arr = Array(s)
    var zero_cnt = 0
    var cnt = 0
    while arr.count != 1 {
        for i in 0..<arr.count {
            if arr[i] == "0" { zero_cnt += 1 }
        }
        var temp = arr.filter({$0 == "1"}).count
        arr = Array(String(temp, radix: 2))
        cnt += 1
    }
    
    return [cnt, zero_cnt]
    
}

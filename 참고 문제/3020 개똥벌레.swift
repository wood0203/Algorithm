import Foundation

// 누적합 문제라고 전부 다 누적합을 사용하는것은 아니다.
// 먼저 특정 높이를 찾아야하므로 -> 이분탐색.
// ** 몰랐던 내용 upper,lower bounds 개념 사용. https://woongsios.tistory.com/255

let nh = readLine()!.split(separator: " ").map({Int($0)!})
let (n, h) = (nh[0], nh[1])
var obst1 = [Int]()
var obst2 = [Int]()
var crash_cnt = [Int:Int]()
var minKey = 511111

for i in 0..<n {
    let input = Int(readLine()!)!
    if i % 2 == 0 { obst1.append(input)}
    else {obst2.append(input)}
}

obst1.sort()
obst2.sort()

func binary_search(_ arr:[Int], _ target:Int, _ upper:Bool ) -> Int {
    var low = 0
    var high = arr.count // high = 배열길이-1이 아닌 이유는 target보다 큰 값의 위치를 반환해야하므로
    
    while low < high {
        var mid = (low + high) / 2
        if arr[mid] == target {
            upper ? (low = mid + 1) : (high = mid)
            // upper bound는 target보다 큰 값이므로 -> low = mid+1
            // lower bound는 target과 같거나 보다 큰값이므로 -> high = mid
        }
        else if arr[mid] > target {
            high = mid
        }
        else {
            low = mid + 1
        }
    }
    
    return low
}


for height in 0..<h {
    var count = obst1.count - binary_search(obst1, height, false)
    count += obst2.count - binary_search(obst2, h-height, true)
    // h - height인 이유는 종유석은 거꾸로 매달려있는데, 값 입력받을때도 그대로 받으므로 개똥벌레도 천장쪽으로 뒤집어주기 때문이다.
    // 다시한번 이해될떄까지 생각해보자
    
    if crash_cnt[count] != nil { crash_cnt[count]! += 1 }
    else {
        crash_cnt[count] = 1
        minKey = min(count, minKey)
    }
}

print(minKey, crash_cnt[minKey]!)

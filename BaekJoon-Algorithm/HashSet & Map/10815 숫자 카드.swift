import Foundation

let n = Int(readLine()!)!
let cards = Set(readLine()!.split(separator: " ").map({Int($0)!}))
let m = Int(readLine()!)!
let result = readLine()!.split(separator: " ").map({ (number:Substring) -> Int in
    // split 함수는 Substring을 반환시킨다는거 까먹지 말것!!
    // 클로저 편하게 $를 이용해서 파라미터를 받을 수 있지만 자세한 구현도 가능해야함.
    if cards.contains(Int(number)!) { return 1 }
    return 0
})

for num in result { print(num, terminator: " ") }
// print(result, speerator:" ")
// 이렇게 출력하면 [, , ] 배열 형태가 그대로 출력돼기 때문에 틀림.

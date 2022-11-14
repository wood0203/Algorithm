import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var queue:[Int] = [0]
    var x1 = 0; var x2 = 0
    var result = 0
    var len = numbers.count
    for i in 0..<len {
        var temp:[Int] = []
        for j in 0..<queue.count {
            var x = queue[j]
            x1 = x + numbers[i]; x2 = x - numbers[i]
            temp.append(contentsOf:[x1, x2])
        }
        queue = temp
    }
    
    for number in queue {
        if number == target { result += 1 }
    }
    
    return result
}

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var lines = convertToLines(board)
    var basket:[Int] = []
    
    for number in moves {
        if lines[number-1].count == 0 {
            continue
        }
        else {
            let doll = lines[number-1].removeLast()
            basket.append(doll)
        }
    }
    
    return checkBasket(basket, 0)
}

func convertToLines(_ board:[[Int]]) -> [[Int]] {
    var lines:[[Int]] = Array(repeating:[Int](), count:board.count)
    for column in stride(from: board.count-1, through: 0, by: -1) {
        for row in stride(from: board.count-1, through: 0, by: -1) {
            if board[row][column] != 0 { lines[column].append(board[row][column]) }
        }
    }
    
    return lines
}

func checkBasket(_ basket:[Int], _ cnt:Int) -> Int {
    var input = basket
    var deleteCnt = cnt
    
    if basket.count < 2 { return cnt }
    
    for i in 0..<basket.count-1 {
        if input[i] == input[i+1] {
            input[i] = 0; input[i+1] = 0
            deleteCnt += 2
        }
    }
    
    if cnt == deleteCnt { return cnt }
    
    return checkBasket(input.filter({ $0 != 0 }), deleteCnt)
}

print(solution([[0, 0, 0, 0], [0, 0, 0, 0], [0, 4, 4, 0], [1, 2, 2, 1]]
         , [2, 3, 1, 4, 2, 3]))

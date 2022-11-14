import Foundation

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    var queue:[[Int]] = []
    var blanks:[Int:[String]] = [:]
    var puzzles:[Int:[String]] = [:]
    var visited = Array(repeating:Array(repeating:false, count:game_board.count),
                        count:game_board.count)
    var move_x = [-1,1,0,0]; var move_y = [0,0,-1,1]
    var move_dict = [0:"U", 1:"D", 2:"L", 3:"R"]
    var rotation = ["L":"U", "U":"R", "R":"D", "D":"L", "S":"S"]
    var result = 0
    
    func find(_ board:[[Int]]) {
        for i in 0..<game_board.count {
            for j in 0..<game_board.count {
                if board[i][j] == 0 && !visited[i][j] {
                    var temp:[String] = ["S"]
                    var cnt = 1
                    visited[i][j] = true
                    queue.append([i,j])
                    while !queue.isEmpty {
                        let xy = queue.removeFirst()
                        let (x, y) = (xy[0], xy[1])
                        for i in 0..<4 {
                            var dx = x + move_x[i]
                            var dy = y + move_y[i]
                            if (0..<board.count).contains(dx) && (0..<board.count).contains(dy) {
                                if !visited[dx][dy] {
                                    cnt += 1
                                    queue.append([dx, dy])
                                    visited[dx][dy] = true
                                    temp.append(move_dict[i]!)
                }}}}
                if board == game_board {
                    if blanks[cnt] == nil { blanks[cnt] = temp}
                    else {blanks[cnt]! += blanks[cnt]! + temp}
                } else {
                    if puzzles[cnt] == nil { puzzles[cnt] = temp}
                    else {puzzles[cnt]! += puzzles[cnt]! + temp}
                }
    }}}}
    
    func rotate(_ puzzle:[String], _ target:[String]) -> [String] {
        for i in 0..<4 {
            var temp:[String] = []
            for p in puzzle {
                temp.append(rotation[p]!)
            }
            
            if temp == target { return []}
        }
        
        return []
    }
    
    find(game_board)
    visited = Array(repeating:Array(repeating:false, count:game_board.count),
                        count:game_board.count)
    find(table)
    
}

import Foundation

let n = Int(readLine()!)!
var answer:Decimal = 0
var students:[Int:[Int]] = [:]
var tables = Array(repeating: Array(repeating: 0, count: n), count: n)
var move_x = [-1,1,0,0]
var move_y = [0,0,-1,1]
var keys: [Int] = []
for _ in 0..<n*n {
    var student = readLine()!.split(separator: " ").map { Int($0)! }
    keys.append(student.removeFirst())
    students[keys[keys.count-1]] = student
}
tables[1][1] = keys[0]

for i in 1..<keys.count {
    let index = checkFavorites(keys[i])
    tables[index[0]][index[1]] = keys[i]
}

for i in 0..<n {
    for j in 0..<n {
        var cnt = 0
        let x = i
        let y = j
        for k in 0..<4 {
            let dx = x + move_x[k]
            let dy = y + move_y[k]
            if 0 <= dx && dx < n && 0 <= dy && dy < n {
                if students[tables[x][y]]!.contains(tables[dx][dy]) {
                    cnt += 1
                }
            }
        }
        if cnt > 0 {
            answer += pow(10, cnt-1)
        }
    }
}

print(answer)

func checkFavorites(_ student: Int) -> [Int] {
    var positions:[[Int]] = []
    let favorites = students[student]!
    var emptyChairs:[[Int]] = []
    for i in 0..<n {
        for j in 0..<n {
            if tables[i][j] == 0 {
                emptyChairs.append([i, j])
            }
        }
    }
    
    for chair in emptyChairs {
        var count = 0
        let x = chair[0]
        let y = chair[1]
        for i in 0..<4 {
            let dx = x + move_x[i]
            let dy = y + move_y[i]
            if 0 <= dx && dx < n && 0 <= dy && dy < n {
                if favorites.contains(tables[dx][dy]) {
                    count += 1
                }
            }
        }
        if 0 <= x && x < n && 0 <= y && y < n {
            positions.append([count, x, y])
        }
    }
    
    guard positions.count > 1 else {
        return [positions[0][1], positions[0][2]]
    }
    
    var firstRank = 0
    for i in 0..<positions.count {
        firstRank = max(firstRank, positions[i][0])
    }
    
    var temp = positions.filter {
        return $0[0] == firstRank
    }
    
    var tt:[[Int]] = []
    for pos in temp {
        var count = 0
        let xx = pos[1]
        let yy = pos[2]
        for i in 0..<4 {
            let dx = xx + move_x[i]
            let dy = yy + move_y[i]
            if 0 <= dx && dx < n && 0 <= dy && dy < n {
                if tables[dx][dy] == 0 {
                    count += 1
                }
            }
        }
        tt.append([count, xx, yy])
    }
    
    var maximum1 = 0
    for t in tt {
        maximum1 = max(maximum1, t[0])
    }
    
    temp = tt.filter { $0[0] == maximum1 }
    
    var bestPlace = [n-1, n-1]
    for pos in temp {
        if bestPlace[0] == pos[1] {
            if bestPlace[1] > pos[2] {
                bestPlace[0] = pos[1]
                bestPlace[1] = pos[2]
            }
        }
        else if bestPlace[0] < pos[1] {
            continue
        }
        else {
            bestPlace[0] = pos[1]
            bestPlace[1] = pos[2]
        }
    }
    
    return bestPlace
}

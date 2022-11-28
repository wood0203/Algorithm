// 백준 N-queen 첫 시도 8 이상부터 시간초과..
import Foundation

let n = Int(readLine()!)!
var result = 0
var visited = [[Bool]]()

for i in 0..<n {
    for j in 0..<n {
        putQueen(i, j, [[i,j]])
    }
}

print(result)

func putQueen(_ i:Int, _ j:Int, _ tmp:[[Int]]) {
    if n == 1{
        print(0)
        return
    }

    if tmp.count == n {
        result += 1
        return
    }

    for x in i+1..<n {
        for y in 0..<n {
            if !Check(x, y, tmp) { continue }
            else { putQueen(x, y, tmp + [[x, y]]) }
        }
    }

    func Check(_ a:Int, _ b:Int, _ tmp2:[[Int]]) -> Bool {
        // a, b : 현재 위치 / check_lst : 이미 들어있는 큐
        for chk in tmp2 {
            let (da, db) = (chk[0], chk[1])
            // da, db 비교대상
            for k in 0..<n {
                if da+k == a && db+k == b { return false }
                if da+k == a && db == b { return false }
                if da+k == a && db-k == b { return false }
            }
        }
        return true
    }
}

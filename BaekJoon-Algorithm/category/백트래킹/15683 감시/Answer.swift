import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var room: [[Int]] = []
var cameras:[[Int]] = []
var result = 0
var wallCount = 0
for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    for (j, value) in row.enumerated() {
        if (1...5).contains(value) {
            cameras.append([i, j])
        }

        if value == 6 {
            wallCount += 1
        }
    }
    room.append(row)
}

var watchedPosintQueue: [[[Int]]] = Array(repeating: [[Int]](), count: cameras.count)
func watch(_ direction: Int, position: [Int], _ cameraCount: Int) -> Int {
    let x = position[0]; let y = position[1]
    var count = 0
    switch direction {
    case  0:
        for k in 0..<m-y {
            if room[x][y+k] == 6 {
                return count
            }

            if room[x][y+k] == 0 {
                watchedPosintQueue[cameraCount].append([x, y+k])
                room[x][y+k] = -1
                count += 1
            }
        }
    case  1:
        for k in 0..<n-x {
            if room[x+k][y] == 6 {
                return count
            }

            if room[x+k][y] == 0 {
                watchedPosintQueue[cameraCount].append([x+k, y])
                room[x+k][y] = -1
                count += 1
            }
        }
    case  2:
        for k in (0..<y).reversed() {
            if room[x][k] == 6 {
                return count
            }

            if room[x][k] == 0 {
                watchedPosintQueue[cameraCount].append([x, k])
                room[x][k] = -1
                count += 1
            }
        }
    default:
        for k in (0..<x).reversed() {
            if room[k][y] == 6 {
                return count
            }

            if room[k][y] == 0 {
                watchedPosintQueue[cameraCount].append([k, y])
                room[k][y] = -1
                count += 1
            }
        }
    }
    return count
}

func backTrcaking(cameraNumber: Int, totalCount: Int) {
    if cameraNumber == cameras.count {
        result = max(result, totalCount)
        return
    }

    let camera = cameras[cameraNumber]
    let x = camera[0]; let y = camera[1]
    for direction in 0..<4 {
        var tempCount = totalCount

        tempCount += watch(direction, position: [x, y], cameraNumber)
        switch room[x][y] {
        case  2:
            tempCount += watch((direction+2) % 4, position: [x, y], cameraNumber)
        case  3:
            tempCount += watch((direction+3) % 4, position: [x, y], cameraNumber)
        case  4:
            tempCount += watch((direction+2) % 4, position: [x, y], cameraNumber)
            tempCount += watch((direction+3) % 4, position: [x, y], cameraNumber)
        case  5:
            tempCount += watch((direction+1) % 4, position: [x, y], cameraNumber)
            tempCount += watch((direction+2) % 4, position: [x, y], cameraNumber)
            tempCount += watch((direction+3) % 4, position: [x, y], cameraNumber)
        default:
            break
        }

        backTrcaking(cameraNumber: cameraNumber + 1, totalCount: tempCount)

        let queueCount = cameraNumber
        for watchedPoint in watchedPosintQueue[queueCount] {
            let x = watchedPoint[0]; let y = watchedPoint[1]
            room[x][y] = 0
        }
        if watchedPosintQueue[queueCount].count >= 1 {
            watchedPosintQueue[queueCount].removeAll()
        }
    }
}

backTrcaking(cameraNumber: 0, totalCount: 0)
print(n*m - wallCount - cameras.count - result)

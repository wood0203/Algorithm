import Foundation

let nm = readLine()!.components(separatedBy: " ").map({Int($0)!})
var graph:[[Int]] = []
for _ in 0..<nm[0] {
    graph.append(readLine()!.components(separatedBy: " ").map({Int($0)!}))
}

func r10(_ i:Int, _ j:Int) -> Int {
    var temp = graph[i][j]
    for k in 1..<10 {
        if j+k >= nm[1] {return 0}
        temp += graph[i][j+k]
        if temp == 10 {return 1}
        if temp >= 10 {return 0}
    }
    return 0
}

func r2c5(_ i:Int, _ j:Int) -> Int {
    if i+1 >= nm[0] {return 0}
    var answer = 0
    var temp = graph[i][j] + graph[i+1][j]
    if temp == 10 {return 1}
    for k in 1..<5 {
        if j+k >= nm[1] {return 0}
        temp += (graph[i][j+k] + graph[i+1][j+k])
        if temp == 10 {return 1}
        if temp >= 10 {return 0}
    }
    return 0
}

func r3c3(_ i:Int, _ j:Int) -> Int {
    if i+2 >= nm[0] {return 0}
    var answer = 0
    var temp = graph[i][j] + graph[i+1][j] + graph[i+2][j]
    if temp == 10 {return 1}
    for k in 1..<3 {
        if j+k >= nm[1] {return 0}
        temp += (graph[i][j+k] + graph[i+1][j+k] + graph[i+2][j+k])
        if temp == 10 {return 1}
        if temp >= 10 {return 0}
    }
    return 0
}

func r4c2(_ i:Int, _ j:Int) -> Int {
    if i+3 >= nm[0] {return 0}
    var temp = graph[i][j] + graph[i+1][j] + graph[i+2][j] + graph[i+3][j]
    if temp == 10 {return 1}
    if j+1 >= nm[1] {return 0}
    temp += (graph[i][j+1] + graph[i+1][j+1] + graph[i+2][j+1] + graph[i+3][j+1])
    if temp == 10 {return 1}
    if temp >= 10 {return 0}
    return 0
}

func r5c2(_ i:Int, _ j:Int) -> Int {
    if i+4 >= nm[0] {return 0}
    var temp = graph[i][j] + graph[i+1][j] + graph[i+2][j] + graph[i+3][j] + graph[i+4][j]
    if temp == 10 {return 1}
    if j+1 >= nm[1] {return 0}
    temp += (graph[i][j+1] + graph[i+1][j+1] + graph[i+2][j+1] + graph[i+3][j+1] + graph[i+4][j+1])
    if temp == 10 {return 1}
    if temp >= 10 {return 0}
    return 0
}

func c10(_ i:Int, _ j:Int) -> Int {
    if i+5 >= nm[0] {return 0}
    var temp = graph[i][j] + graph[i+1][j] + graph[i+2][j] + graph[i+3][j] + graph[i+4][j] + graph[i+5][j]
    if temp == 10 {return 1}
    for k in 7..<10 {
        if i+k >= nm[0] {return 0}
        temp += graph[i+5][j]
        if temp == 10 {return 1}
        if temp >= 10 {return 0}
    }
    return 0
}

var answer = 0
for i in 0..<nm[0] {
    for j in 0..<nm[1] {
        answer += (r10(i,j) + r2c5(i,j) + r3c3(i,j) + r4c2(i,j) + r5c2(i,j) + c10(i,j))
    }
}
print(answer)

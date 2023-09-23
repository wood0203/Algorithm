import Foundation

var maxHeap = [0]

func insert(node: Int) {
    maxHeap.append(node)
    moveUp(index: maxHeap.count - 1)
}

func moveUp(index: Int) {
    guard index > 1 else {
        return
    }
    
    let parentIndex = index / 2
    guard parentIndex > 0 else {
        return
    }
    
    if maxHeap[parentIndex] < maxHeap[index] {
        maxHeap.swapAt(index, parentIndex)
        moveUp(index: parentIndex)
    }
}

func delete() -> Int {
    guard maxHeap.count > 1 else {
        return -1
    }
    
    if maxHeap.count == 2 {
        return maxHeap.removeLast()
    }
    
    let firstNode = maxHeap[1]
    maxHeap[1] = maxHeap.removeLast()
    moveDown(index: 1)
    return firstNode
}

func moveDown(index: Int) {
    guard index < maxHeap.count else {
        return
    }
    
    let leftChildIndex = index * 2
    guard leftChildIndex < maxHeap.count else {
        return
    }
    
    let rightChildIndex = leftChildIndex + 1
    guard rightChildIndex < maxHeap.count else {
        if maxHeap[index] < maxHeap[leftChildIndex] {
            maxHeap.swapAt(index, leftChildIndex)
            moveDown(index: leftChildIndex)
        }
        return
    }
    
    if max(maxHeap[index], maxHeap[leftChildIndex], maxHeap[rightChildIndex]) == maxHeap[index] {
        return
    }
    
    if maxHeap[leftChildIndex] > maxHeap[rightChildIndex] {
        maxHeap.swapAt(index, leftChildIndex)
        moveDown(index: leftChildIndex)
    } else {
        maxHeap.swapAt(index, rightChildIndex)
        moveDown(index: rightChildIndex)
    }
}

func solution() -> Int {
    let n = Int(readLine()!)!
    var dasom = Int(readLine()!)!
    var answer = 0
    
    for _ in 0..<(n-1) {
        let candidate = Int(readLine()!)!
        insert(node: candidate)
    }
    
    if n == 1 {
        return 0
    }
    
    while dasom <= maxHeap[1] {
        let candidate = delete() - 1
        insert(node: candidate)
        dasom += 1
        answer += 1
    }
    
    return answer
}

print(solution())

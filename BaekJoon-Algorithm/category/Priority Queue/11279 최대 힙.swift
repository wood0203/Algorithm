import Foundation

let n = Int(readLine()!)!
var maxHeap: [Int] = [0]
for _ in 0..<n {
    let number = Int(readLine()!)!
    if number == 0 {
        print(delete())
        continue
    }

    insert(x: number)
}

func insert(x: Int) {
    maxHeap.append(x)
    moveUp(index: maxHeap.count - 1)
}

func moveUp(index: Int) {
    let parentIndex = index / 2
    guard parentIndex >= 1 else {
        return
    }
    
    if maxHeap[index] > maxHeap[parentIndex] {
        maxHeap.swapAt(index, parentIndex)
        moveUp(index: parentIndex)
    }
}

func delete() -> Int {
    guard maxHeap.count > 1 else {
        return 0
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
    let leftChildIndex = index * 2
    let rightChildIndex = (index * 2) + 1
    
    let currentNode = maxHeap[index]

    // 자식이 없는 경우
    guard maxHeap.count - 1 >= leftChildIndex else {
        return
    }
    
    // 독자인 경우
    let leftChildNode = maxHeap[leftChildIndex]
    if maxHeap.count - 1 == leftChildIndex {
        if currentNode < leftChildNode {
            maxHeap.swapAt(index, leftChildIndex)
            moveDown(index: leftChildIndex)
        }
        return
    }

    // 현재 노드가 제일 큰 경우
    let rightChildNode = maxHeap[rightChildIndex]
    guard max(currentNode, leftChildNode, rightChildNode) != currentNode else {
        return
    }

    if leftChildNode > rightChildNode {
        maxHeap.swapAt(index, leftChildIndex)
        moveDown(index: leftChildIndex)
    }
    else {
        maxHeap.swapAt(index, rightChildIndex)
        moveDown(index: rightChildIndex)
    }
}

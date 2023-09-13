import Foundation

var heap: [Int] = [0]

func moveUp(index: Int) {
    guard index > 1 else {
        return
    }
    
    let currentNode = heap[index]
    let parentIndex = index / 2
    let parentNode = heap[parentIndex]
    
    if currentNode < parentNode {
        heap.swapAt(index, parentIndex)
        moveUp(index: parentIndex)
    }
}

func delete() -> Int {
    guard heap.count > 1 else {
        return 0
    }
    
    if heap.count == 2 {
        return Int(heap.removeLast())
    }

    let firstNode = Int(heap[1])
    heap[1] = heap.removeLast()
    moveDown(index: 1)
    return firstNode
}

func moveDown(index: Int) {
    guard index >= 1 else {
        return
    }
    
    let heapCount = heap.count - 1
    let currentNode = heap[index]
    let leftChildIndex = index * 2
    guard leftChildIndex <= heapCount else {
        return
    }
    
    if heapCount == leftChildIndex {
        if heap[leftChildIndex] < currentNode {
            heap.swapAt(index, leftChildIndex)
            moveDown(index: leftChildIndex)
            return
        }
    }

    let leftChildNode = heap[leftChildIndex]
    let rightChildIndex = (index * 2) + 1
    guard rightChildIndex <= heapCount else {
        return
    }
            
    let rightChildNode = heap[rightChildIndex]
    if min(currentNode, leftChildNode, rightChildNode) == currentNode {
        return
    }
    
    if leftChildNode < rightChildNode {
        heap.swapAt(index, leftChildIndex)
        moveDown(index: leftChildIndex)
    } else {
        heap.swapAt(index, rightChildIndex)
        moveDown(index: rightChildIndex)
    }
}

func solution() {
    let n = Int(readLine()!)!
    if n < 1 || n > 100000 {
        return
    }
    
    for _ in 0..<n {
        let deck = Int(readLine()!)!
        if deck < 1 || deck > 1000 {
            return
        }
        heap.append(deck)
        moveUp(index: heap.count - 1)
    }
    
    if n == 1 {
        print(0)
        return
    }

    var answer = 0
    for _ in 0..<n-1 {
        let first = delete()
        let second = delete()
        let temp = first + second
        answer += temp
        heap.append(temp)
        moveUp(index: heap.count - 1)
    }

    print(answer)
}

solution()

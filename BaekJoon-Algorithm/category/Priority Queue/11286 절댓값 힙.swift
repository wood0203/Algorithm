import Foundation

struct Node: Comparable {
    let absValue: UInt32
    let value: Int
    
    init(value: Int) {
        let absValue = abs(value)
        self.absValue = UInt32(absValue)
        self.value = value
    }
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        if lhs.absValue == rhs.absValue {
            return lhs.value < rhs.value
        }
        return lhs.absValue < rhs.absValue
    }
}

let n = Int(readLine()!)!
var heap: [Node] = [Node(value: 0)]
for _ in 0..<n {
    let number = Int(readLine()!)!
    if number == 0 {
        print(delete(number: number))
        continue
    }
    
    insert(number: number)
}

func moveDown(index: Int) {

    let heapCount = heap.count - 1
    // 자식이 없을 때 탈출
    guard heapCount >= index * 2 else {
        return
    }

    let currentNode = heap[index]
    let leftChildIndex = index * 2
    let leftChildNode = heap[leftChildIndex]
    // 왼쪽 자식이 있을 때
    guard heapCount > index * 2 else {
        if currentNode > leftChildNode {
            heap.swapAt(index, leftChildIndex)
            moveDown(index: leftChildIndex)
            return
        }

        return
    }
    
    let rightChildIndex = (index * 2) + 1
    let rightChildNode = heap[rightChildIndex]
    // 모든 자식과 비교 했을 때 현재 노드가 제일 작으면
    guard min(currentNode, leftChildNode, rightChildNode) != currentNode else {
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

func delete(number: Int) -> Int {
    guard heap.count > 1 else {
        return 0
    }

    guard heap.count != 2 else {
        return heap.removeLast().value
    }

    let firstNode = heap[1]
    heap[1] = heap.removeLast()
    moveDown(index: 1)
    return firstNode.value
}

func moveUp(index: Int) {
    guard index > 1 else {
        return
    }

    let parentIndex = index / 2
    guard parentIndex > 0 else {
        return
    }
    
    let currentNode = heap[index]
    let parentNode = heap[parentIndex]
    if currentNode < parentNode {
        heap.swapAt(index, parentIndex)
        moveUp(index: parentIndex)
        return
    }
}

func insert(number: Int) {
    let newNode = Node(value: number)
    heap.append(newNode)
    moveUp(index: heap.count - 1)
}

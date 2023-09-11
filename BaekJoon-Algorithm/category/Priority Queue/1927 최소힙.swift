import Foundation

let n = Int(readLine()!)!
var minimumHeap: [Int] = [0]
for _ in 0..<n {
    let number = Int(readLine()!)!
    if number == 0 {
        print(delete())
        continue
    }

    insert(x: number)
}

func insert(x: Int) {
    minimumHeap.append(x)
    heapify(index: minimumHeap.count - 1, isInsert: true)
}

func delete() -> Int {
    if minimumHeap.count <= 1 {
        return 0
    }

    if minimumHeap.count == 2 {
        return minimumHeap.removeLast()
    }
    
    let firstNode = minimumHeap[1]
    minimumHeap[1] = minimumHeap.removeLast()
    heapify(index: 1, isInsert: false)

    return firstNode
}

func heapify(index: Int, isInsert: Bool) {

    if isInsert {
        guard index > 1 else {
            return
        }
        
        let parentIndex = index / 2
        if minimumHeap[parentIndex] <= minimumHeap[index] {
            return
        }
        else {
            minimumHeap.swapAt(index, parentIndex)
            heapify(index: parentIndex, isInsert: true)
        }
    }
    else {
        // 자식 존재 X
        if minimumHeap.count <= index * 2 {
            return
        }
        // 왼쪽 자식 노드만 존재
        else if minimumHeap.count == index * 2 + 1 {
            let currentNode = minimumHeap[index]
            let leftChildNode = minimumHeap[index * 2]
            if min(currentNode, leftChildNode) == currentNode {
                return
            }

            minimumHeap.swapAt(index, index * 2)
            heapify(index: index * 2, isInsert: false)
        }
        else {
            let currentNode = minimumHeap[index]
            let leftChildNode = minimumHeap[index * 2]
            let rightChildNode = minimumHeap[index*2 + 1]
            
            if min(currentNode, leftChildNode, rightChildNode) == currentNode {
                return
            }

            if leftChildNode <= rightChildNode {
                minimumHeap.swapAt(index, index * 2)
                heapify(index: index * 2, isInsert: false)
            }
            else {
                minimumHeap.swapAt(index, index*2 + 1)
                heapify(index: (index * 2) + 1, isInsert: false)
            }
        }
    }
}

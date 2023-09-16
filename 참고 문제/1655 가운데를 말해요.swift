import Foundation

class MedianPriorityQueue: CustomDebugStringConvertible {
    private var maxHeap: [Int]
    private var minHeap: [Int]
    var size: Int {
        return (maxHeap.count + minHeap.count) - 2
    }
    
    var debugDescription: String {
        return "maxHeap: \(maxHeap)\nminHeap: \(minHeap)"
    }
    
    init() {
        maxHeap = [0]
        minHeap = [0]
    }
    
    func peek() -> Int {
        if maxHeap.count <= 1 {
            return -1
        }
        return maxHeap[1]
    }
    
    func insert(node: Int) {
        if maxHeap.count == minHeap.count {
            maxHeap.append(node)
            moveUp(index: maxHeap.count - 1, isMaxHeap: true)
        } else {
            minHeap.append(node)
            moveUp(index: minHeap.count - 1, isMaxHeap: false)
        }
        switchIfNeeded()
    }
    
    func switchIfNeeded() {
        guard maxHeap.count > 1 && minHeap.count > 1 else {
            return
        }
        
        if maxHeap[1] > minHeap[1] {
            let temp = minHeap[1]
            minHeap[1] = maxHeap[1]
            maxHeap[1] = temp
            moveDown(index: 1, isMaxHeap: true)
            moveDown(index: 1, isMaxHeap: false)
        }
    }
    
    private func moveUp(index: Int, isMaxHeap: Bool) {
        guard index > 1 else {
            return
        }
        
        let parentIndex = index / 2
        guard parentIndex > 0 else {
            return
        }

        if isMaxHeap {
            if self.maxHeap[parentIndex] < self.maxHeap[index] {
                maxHeap.swapAt(index, parentIndex)
                moveUp(index: parentIndex, isMaxHeap: true)
            }
        }
        else {
            if self.minHeap[parentIndex] > self.minHeap[index] {
                minHeap.swapAt(index, parentIndex)
                moveUp(index: parentIndex, isMaxHeap: false)
            }
        }
    }
    
    private func moveDown(index: Int, isMaxHeap: Bool) {
        if isMaxHeap {
            guard index < maxHeap.count else {
                return
            }
            
            let currentNode = maxHeap[index]
            let leftChildIndex = index * 2
            guard leftChildIndex < maxHeap.count else {
                return
            }
            
            let leftChildNode = maxHeap[leftChildIndex]
            let rightChildIndex = leftChildIndex + 1
            guard rightChildIndex < maxHeap.count else {
                if maxHeap[index] < maxHeap[leftChildIndex] {
                    maxHeap.swapAt(index, leftChildIndex)
                    moveDown(index: leftChildIndex, isMaxHeap: true)
                }
                return
            }
            
            let rightChildNode = maxHeap[rightChildIndex]
            if max(currentNode, leftChildNode, rightChildNode) == currentNode {
                return
            }
            
            if leftChildNode > rightChildNode {
                maxHeap.swapAt(index, leftChildIndex)
                moveDown(index: leftChildIndex, isMaxHeap: true)
            } else {
                maxHeap.swapAt(index, rightChildIndex)
                moveDown(index: rightChildIndex, isMaxHeap: true)
            }
        }
        else {
            guard index < minHeap.count else {
                return
            }
            
            let currentNode = minHeap[index]
            let leftChildIndex = index * 2
            guard leftChildIndex < minHeap.count else {
                return
            }
            
            let leftChildNode = minHeap[leftChildIndex]
            let rightChildIndex = leftChildIndex + 1
            guard rightChildIndex < minHeap.count else {
                if minHeap[index] > minHeap[leftChildIndex] {
                    minHeap.swapAt(index, leftChildIndex)
                    moveDown(index: leftChildIndex, isMaxHeap: false)
                }
                return
            }
            
            let rightChildNode = minHeap[rightChildIndex]
            if min(currentNode, leftChildNode, rightChildNode) == currentNode {
                return
            }
            
            if leftChildNode < rightChildNode {
                minHeap.swapAt(index, leftChildIndex)
                moveDown(index: leftChildIndex, isMaxHeap: false)
            } else {
                minHeap.swapAt(index, rightChildIndex)
                moveDown(index: rightChildIndex, isMaxHeap: false)
            }
        }
    }
}

let queue = MedianPriorityQueue()
let n = Int(readLine()!)!
for _ in 0..<n {
    let number = Int(readLine()!)!
    queue.insert(node: number)
    print("answer is:\(queue.peek())")
}

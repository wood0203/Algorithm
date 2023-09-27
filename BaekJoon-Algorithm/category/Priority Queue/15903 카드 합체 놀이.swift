import Foundation

var minHeap: [Int] = [0]
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let cards = readLine()!.split(separator: " ").map { Int($0)! }

for card in cards {
    insert(card: card)
}

for _ in 0..<m {
    let firstCard = delete()
    let secondCard = delete()
    if firstCard == -1 || secondCard == -1 {
        print("error")
        break
    }
    
    let sum = firstCard + secondCard
    insert(card: sum)
    insert(card: sum)
}

print(minHeap.reduce(0, +))

func insert(card: Int) {
    minHeap.append(card)
    moveUp(index: minHeap.count - 1)
}

func moveUp(index: Int) {
    let parentIndex = index / 2

    guard index > 1 && parentIndex > 0 else {
        return
    }
    
    if minHeap[parentIndex] > minHeap[index] {
        minHeap.swapAt(index, parentIndex)
        moveUp(index: parentIndex)
        return
    }
}

func delete() -> Int {
    guard minHeap.count > 1 else {
        return -1
    }
    
    if minHeap.count == 2 {
        return minHeap.removeLast()
    }
    
    let firstCard = minHeap[1]
    minHeap[1] = minHeap.removeLast()
    moveDown(index: 1)
    return firstCard
}

func moveDown(index: Int) {
    guard index < minHeap.count else {
        return
    }
    
    let leftChildIndex = index * 2
    guard leftChildIndex < minHeap.count else {
        return
    }

    let rightChildIndex = leftChildIndex + 1
    guard rightChildIndex < minHeap.count else {
        if minHeap[index] > minHeap[leftChildIndex] {
            minHeap.swapAt(index, leftChildIndex)
            moveDown(index: leftChildIndex)
        }
        return
    }
    
    if min(minHeap[index], minHeap[leftChildIndex], minHeap[rightChildIndex]) == minHeap[index] {
        return
    }
    
    if minHeap[leftChildIndex] < minHeap[rightChildIndex] {
        minHeap.swapAt(index, leftChildIndex)
        moveDown(index: leftChildIndex)
    } else {
        minHeap.swapAt(index, rightChildIndex)
        moveDown(index: rightChildIndex)
    }
}







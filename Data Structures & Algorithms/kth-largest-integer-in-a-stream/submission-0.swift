class KthLargest {
    var minHeap = [Int]()
    let k: Int
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        buildHeapForFirstTime(nums)
    }

    func add(_ val: Int) -> Int {
        addInMinHeap(num: val)
        return peekHeap()
    }
    
    func buildHeapForFirstTime(_ nums: [Int]) {
        for num in nums {
            addInMinHeap(num: num)
        }
    }
    
    func addInMinHeap(num: Int) {
        if minHeap.count > 0 {
            if (num >= peekHeap() || minHeap.count < k) {
                addByBubbleDown(num: num)
            }
        } else {
            minHeap.append(num)
        }
    }
    
    func addByBubbleDown(num: Int) {
        minHeap.append(num)
        var currentIndex = minHeap.count - 1
        var parentIndex = (currentIndex - 1) / 2
        while parentIndex >= 0  {
            if minHeap[parentIndex] > minHeap[currentIndex] {
                (minHeap[parentIndex], minHeap[currentIndex]) = (minHeap[currentIndex], minHeap[parentIndex])
                currentIndex = parentIndex
                parentIndex = (currentIndex - 1) / 2
            } else {
                break
            }
        }
        if minHeap.count > k { removeByBubbleUp() }
    }
    
    func removeByBubbleUp() {
        var count = minHeap.count
        if count > 1 {
            (minHeap[0], minHeap[count - 1]) = (minHeap[count - 1], minHeap[0])
        }
        minHeap.removeLast()
        count = minHeap.count
        
        var currentIndex = 0
        var leftChild = (currentIndex * 2) + 1
        var rightChild = (currentIndex * 2) + 2
        
        while (rightChild < count)  {
            if minHeap[leftChild] > minHeap[rightChild] {
                guard minHeap[currentIndex] > minHeap[rightChild] else { break }
                (minHeap[rightChild], minHeap[currentIndex]) = (minHeap[currentIndex], minHeap[rightChild])
                currentIndex = rightChild
                leftChild = (currentIndex * 2) + 1
                rightChild = (currentIndex * 2) + 2
            } else if minHeap[currentIndex] > minHeap[leftChild] {
                (minHeap[leftChild], minHeap[currentIndex]) = (minHeap[currentIndex], minHeap[leftChild])
                currentIndex = leftChild
                leftChild = (currentIndex * 2) + 1
                rightChild = (currentIndex * 2) + 2
            } else {
                break
            }
        }
        
        while (leftChild < count)  {
            if minHeap[currentIndex] > minHeap[leftChild] {
                (minHeap[leftChild], minHeap[currentIndex]) = (minHeap[currentIndex], minHeap[leftChild])
                currentIndex = leftChild
                leftChild = (currentIndex * 2) + 1
            } else {
                break
            }
        }
    }
    
    func peekHeap() -> Int {
        return minHeap.first ?? 0
    }
}
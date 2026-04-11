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
                addByBubbleUp(num: num)
            }
        } else {
            minHeap.append(num)
        }
    }
    
    func addByBubbleUp(num: Int) {
        minHeap.append(num)
        var currentIndex = minHeap.count - 1
        var parentIndex = (currentIndex - 1) / 2
        while currentIndex > 0  {
            if minHeap[parentIndex] > minHeap[currentIndex] {
                (minHeap[parentIndex], minHeap[currentIndex]) = (minHeap[currentIndex], minHeap[parentIndex])
                currentIndex = parentIndex
                parentIndex = (currentIndex - 1) / 2
            } else {
                break
            }
        }
        if minHeap.count > k { removeByBubbleDown() }
    }
    
    func removeByBubbleDown() {
        var count = minHeap.count
        if count > 1 {
            (minHeap[0], minHeap[count - 1]) = (minHeap[count - 1], minHeap[0])
        }
        minHeap.removeLast()
        count = minHeap.count
        
        var currentIndex = 0
        
        while true {
            let leftChildIndex = 2 * currentIndex + 1
            let rightChildIndex = 2 * currentIndex + 2
            var smallestIndex = currentIndex
            
            if leftChildIndex < minHeap.count && minHeap[leftChildIndex] < minHeap[smallestIndex] {
                smallestIndex = leftChildIndex
            }
            
            if rightChildIndex < minHeap.count && minHeap[rightChildIndex] < minHeap[smallestIndex] {
                smallestIndex = rightChildIndex
            }
            
            if smallestIndex == currentIndex {
                break
            }
            
            (minHeap[smallestIndex], minHeap[currentIndex]) = (minHeap[currentIndex], minHeap[smallestIndex])
            currentIndex = smallestIndex
        }
    }
    
    func peekHeap() -> Int {
        return minHeap.first ?? 0
    }
}

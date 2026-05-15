class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var topK = TopK(nums)
        
        var numbers = [Int]()
        for i in 0..<k {
            if let element = topK.remove() {
                numbers.append(element)
            }
        }
        return numbers
    }
}

class TopK {
    var elements: [(number: Int, count: Int)] = []
    
    init(_ elements: [Int]) {
        var frequency = [Int: Int]()
        
        for num in elements {
            frequency[num, default: 0] += 1
        }
        
        frequency.forEach {
            add($0.key, $0.value)
        }
    }
    
    func peek() -> (number: Int, count: Int)? {
        return elements.first
    }
    
    func add(_ number: Int, _ count: Int) {
        elements.append((number: number, count: count))
        heapifyUp()
    }
    
    private func heapifyUp() {
        var current = elements.count - 1
        var parent = (current - 1) / 2
        
        while current > 0 {
            if elements[current].count > elements[parent].count {
                swap(current, parent)
                current = parent
                parent = (current - 1) / 2
            } else {
                break
            }
        }
    }
    
    func remove() -> Int? {
        guard !elements.isEmpty else { return nil }
        swap(0, elements.count - 1)
        
        let elementToRemove = elements.removeLast()
        heapifyDown()
        return elementToRemove.number
    }
    
    private func heapifyDown() {
        var current = 0
        var child1 = (current * 2) + 1
        var child2 = (current * 2) + 2
        
        while child2 < elements.count {
            if elements[child1].count > elements[child2].count,
               elements[child1].count > elements[current].count {
                swap(child1, current)
                current = child1
                child1 = (current * 2) + 1
                child2 = (current * 2) + 2
            } else if elements[child2].count > elements[current].count {
                swap(child2, current)
                current = child2
                child1 = (current * 2) + 1
                child2 = (current * 2) + 2
            } else {
                break
            }
        }
        
        if child1 < elements.count,
           elements[child1].count > elements[current].count {
            swap(child1, current)
        }
    }
    
    private func swap(_ index1: Int, _ index2: Int) {
        let temp = elements[index1]
        elements[index1] = elements[index2]
        elements[index2] = temp
    }
}
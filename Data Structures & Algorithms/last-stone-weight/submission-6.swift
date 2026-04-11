class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        let sorted = Heap(elements: stones)
        var left = sorted.popMax()
        var right = sorted.popMax()
        var remainder = 0
        
        while left != nil {
            guard right != nil else { return (left ?? 0) }
            remainder = (left ?? 0) - (right ?? 0)
            if remainder > 0 { sorted.addElement(remainder) }
            left = sorted.popMax()
            right = sorted.popMax()
        }
        
        return remainder
    }
}

class Heap<T: Comparable> {
    var elements = [T]()
    
    init(elements: [T]) {
        for element in elements {
            addElement(element)
        }
    }
    
    func addElement(_ element: T) {
        elements.append(element)
        bubbleUP()
    }
    
    private func bubbleUP() {
        var currentIndex = elements.count - 1
        var parentIndex = (currentIndex - 1) / 2
        
        while parentIndex >= 0 {
            if elements[parentIndex] < elements[currentIndex] {
                swap(currentIndex, parentIndex)
                currentIndex = parentIndex
                parentIndex = (currentIndex - 1) / 2
            } else {
                break
            }
        }
    }
    
    private func swap(_ index1: Int, _ index2: Int) {
        guard index1 < elements.count, index2 < elements.count else { return }
        let temp = elements[index1]
        elements[index1] = elements[index2]
        elements[index2] = temp
    }
    
    func popMax() -> T? {
        guard !elements.isEmpty else { return nil }
        guard elements.count > 1 else { return elements.popLast() }
        swap(0, elements.count - 1)
        let toReturn = elements.popLast()
        bubbleDown()
        return toReturn
    }
    
    private func bubbleDown() {
        var currentIndex = 0
        var leftIndex = (currentIndex * 2) + 1
        var rightIndex = (currentIndex * 2) + 2
        
        while rightIndex < (elements.count) {
            if elements[leftIndex] > elements[rightIndex] && elements[leftIndex] > elements[currentIndex] {
                swap(leftIndex, currentIndex)
                currentIndex = leftIndex
                leftIndex = (currentIndex * 2) + 1
                rightIndex = (currentIndex * 2) + 2
            } else if elements[rightIndex] > elements[currentIndex] {
                swap(rightIndex, currentIndex)
                currentIndex = rightIndex
                leftIndex = (currentIndex * 2) + 1
                rightIndex = (currentIndex * 2) + 2
            } else {
                break
            }
        }
        
        if leftIndex < (elements.count),
           elements[leftIndex] > elements[currentIndex] {
            swap(leftIndex, currentIndex)
            currentIndex = leftIndex
            leftIndex = (currentIndex * 2) + 1
            rightIndex = (currentIndex * 2) + 2
        }
    }
}

class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let maxHeap = MaxHeap(values: points, k: k)
        var keys = [[Int]]()
        for value in maxHeap.values {
            keys.append(value.point)
        }
        return keys
    }

    class MaxHeap {
        var values = [(point: [Int], distance: Int)]()
        var k = 0
        
        init(values: [[Int]], k: Int) {
            self.k = k
            values.forEach {
                addValue($0)
            }
            
        }
        
        func addValue(_ num: [Int]) {
            let x: Int = num.first ?? 0
            let y: Int = num.last ?? 0
            let pointDistance: Int = (x * x) + (y * y)
            
            if values.isEmpty {
                values.append((num, pointDistance))
            } else {
                bottomUp((num, pointDistance))
            }
        }
        
        func bottomUp(_ num: (point: [Int], distance: Int)) {
            if values.count == k && (peekTop() ?? Int.max) < (num.distance) {
                return
            }
            
            values.append(num)
            var current = values.count - 1
            
            while true {
                let parent = (current - 1) / 2
                if parent < current,
                (values[parent].distance) < (values[current].distance) {
                    swap(index1: parent, index2: current)
                    current = parent
                } else {
                    break
                }
            }
            
            if values.count > k {
                removeTop()
            }
        }
        
        func removeTop() {
            guard values.count > 1 else {
                values.removeAll()
                return
            }
            swap(index1: 0, index2: values.count - 1)
            values.removeLast()
            topDown()
        }
        
        func topDown() {
            var current = 0
            var child1 = (current * 2) + 1
            var child2 = (current * 2) + 2
            
            while child2 < values.count {
                if (values[child1].distance) > (values[child2].distance) && (values[child1].distance) > (values[current].distance) {
                    swap(index1: current, index2: child1)
                    current = child1
                    child1 = (current * 2) + 1
                    child2 = (current * 2) + 2
                } else if (values[child2].distance) > (values[current].distance) {
                    swap(index1: current, index2: child2)
                    current = child2
                    child1 = (current * 2) + 1
                    child2 = (current * 2) + 2
                } else {
                    break
                }
            }
            
            while child1 < values.count {
                if (values[child1].distance) > (values[current].distance) {
                    swap(index1: current, index2: child1)
                    current = child1
                    child1 = (current * 2) + 1
                    child2 = (current * 2) + 2
                } else {
                    break
                }
            }
        }
        
        func peekTop() -> Int? {
            return values.first?.distance
        }
        
        func swap(index1: Int, index2: Int) {
            guard index1 < values.count && index2 < values.count else { return }
            let temp = values[index1]
            values[index1] = values[index2]
            values[index2] = temp
        }
    }
}

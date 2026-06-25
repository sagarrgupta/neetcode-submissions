class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let maxHeap = MaxHeap(values: points, k: k)
        var keys = [[Int]]()
        for value in maxHeap.values {
            keys.append(contentsOf: value.keys)
        }
        return keys
    }

    class MaxHeap {
        var values = [[[Int]:Double]]()
        var k = 0
        
        init(values: [[Int]], k: Int) {
            self.k = k
            values.forEach {
                addValue($0)
            }
            
        }
        
        func addValue(_ num: [Int]) {
            guard k > 0 else { return }
            let x: Double = Double(num.first ?? 0)
            let y: Double = Double(num.last ?? 0)
            let pointDistance: Double = Double((x * x) + (y * y))
            
            if values.isEmpty {
                values.append([num:pointDistance])
            } else {
                bottomUp([num:pointDistance])
            }
        }
        
        func bottomUp(_ num: [[Int]:Double]) {
            if values.count == k && (peekTop() ?? Double(Int.max)) < (num.values.first ?? 0) {
                return
            }
            values.append(num)
            var current = values.count - 1
            var parent = (current - 1) / 2
            
            while parent < current {
                if (values[parent].values.first ?? 0) < (values[current].values.first ?? 0) {
                    swap(index1: parent, index2: current)
                    current = parent
                    parent = (current - 1) / 2
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
                if (values[child1].values.first ?? 0) > (values[child2].values.first ?? 0) && (values[child1].values.first ?? 0) > (values[current].values.first ?? 0) {
                    swap(index1: current, index2: child1)
                    current = child1
                    child1 = (current * 2) + 1
                    child2 = (current * 2) + 2
                } else if (values[child2].values.first ?? 0) > (values[current].values.first ?? 0) {
                    swap(index1: current, index2: child2)
                    current = child2
                    child1 = (current * 2) + 1
                    child2 = (current * 2) + 2
                } else {
                    break
                }
            }
            
            while child1 < values.count {
                if (values[child1].values.first ?? 0) > (values[current].values.first ?? 0) {
                    swap(index1: current, index2: child1)
                    current = child1
                    child1 = (current * 2) + 1
                    child2 = (current * 2) + 2
                } else {
                    break
                }
            }
        }
        
        func peekTop() -> Double? {
            return values.first?.values.first
        }
        
        func swap(index1: Int, index2: Int) {
            guard index1 < values.count && index2 < values.count else { return }
            let temp = values[index1]
            values[index1] = values[index2]
            values[index2] = temp
        }
    }
}

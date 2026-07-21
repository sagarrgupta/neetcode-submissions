class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var events = [Character: Int]()
        for task in tasks {
            events[task, default: 0] += 1
        }
        
        var taskOnCooldown = [Int : [(task: Character, count: Int)]]()
        let priorityHeap = MaxHeap(events)
        var totalCycle = 0
        
        while !taskOnCooldown.isEmpty || priorityHeap.peek() != nil {
            if let event = priorityHeap.getPriority(), event.count > 1 {
                taskOnCooldown[n + totalCycle, default: []].append((event.task, event.count - 1))
            }
            
            if let tasksToAdd = taskOnCooldown[totalCycle] {
                for task in tasksToAdd {
                    priorityHeap.insert(task)
                }
                taskOnCooldown.removeValue(forKey: totalCycle)
            }
            totalCycle += 1
        }
        
        return totalCycle
    }

    class MaxHeap {
        var events = [(task: Character, count: Int)]()
        
        init(_ tasks: [Character: Int]) {
            var tasksToInsert = [(task: Character, count: Int)]()
            for task in tasks {
                tasksToInsert.insert((task: task.key, count: task.value), at: 0)
            }
            events = tasksToInsert
            heapify()
        }
        
        func heapify() {
            let lastParent = (events.count / 2) - 1
            for parent in stride(from: lastParent, to: -1, by: -1) {
                heapifyDown(parent)
            }
        }
        
        func insert(_ event : (task: Character, count: Int)) {
            events.append(event)
            heapfiyUp()
        }
        
        func heapfiyUp() {
            var current = events.count - 1
            
            while current != 0 {
                let parent = (current - 1) / 2
                
                if events[current].count > events[parent].count {
                    swap(index1: parent, index2: current)
                    current = parent
                } else {
                    break
                }
            }
        }
        
        func heapifyDown(_ parent: Int?) {
            guard !events.isEmpty else { return }
            var parent = parent ?? 0
            while true {
                var toSwap = parent
                let leftChild = (parent * 2) + 1
                let rightChild = (parent * 2) + 2
                
                if leftChild < events.count,
                events[leftChild].count > events[parent].count {
                    toSwap = leftChild
                }
                
                if rightChild < events.count,
                events[rightChild].count > events[toSwap].count {
                    toSwap = rightChild
                }
                
                if parent == toSwap {
                    break
                } else {
                    swap(index1: toSwap, index2: parent)
                    parent = toSwap
                }
            }
        }
        
        func swap(index1: Int, index2: Int) {
            let temp = events[index1]
            events[index1] = events[index2]
            events[index2] = temp
        }
        
        func getPriority() -> (task: Character, count: Int)? {
            guard !events.isEmpty else { return nil }
            let lastIndex = events.count - 1
            swap(index1: 0, index2: lastIndex)
            let toReturn = events[lastIndex]
            events.removeLast()
            heapifyDown(nil)
            return toReturn
        }
        
        func peek() -> (task: Character, count: Int)? {
            return events.first
        }
    }
}

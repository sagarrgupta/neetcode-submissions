class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard k > 0, k <= nums.count else { return 0 }

        let minHeap = MinHeap(nums, k)
        return minHeap.peek() ?? 0
    }
}

class MinHeap {
    private var values = [Int]()
    private let limit: Int

    init(_ nums: [Int], _ k: Int) {
        limit = k

        for num in nums {
            addValue(num)
        }
    }

    private func addValue(_ value: Int) {
        if values.count == limit,
           let smallest = peek(),
           value <= smallest {
            return
        }

        values.append(value)
        bottomUp()

        if values.count > limit {
            removeTop()
        }
    }

    private func bottomUp() {
        var child = values.count - 1

        while child > 0 {
            let parent = (child - 1) / 2

            if values[parent] > values[child] {
                swap(parent, child)
                child = parent
            } else {
                break
            }
        }
    }

    private func removeTop() {
        guard !values.isEmpty else { return }

        swap(0, values.count - 1)
        values.removeLast()
        topDown()
    }

    private func topDown() {
        var parent = 0

        while true {
            let left = (parent * 2) + 1
            let right = (parent * 2) + 2
            var smallest = parent

            if left < values.count,
               values[left] < values[smallest] {
                smallest = left
            }

            if right < values.count,
               values[right] < values[smallest] {
                smallest = right
            }

            if smallest == parent {
                break
            }

            swap(parent, smallest)
            parent = smallest
        }
    }

    private func swap(_ first: Int, _ second: Int) {
        (values[first], values[second]) = (values[second], values[first])
    }

    func peek() -> Int? {
        values.first
    }
}
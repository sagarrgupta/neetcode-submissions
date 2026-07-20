class Solution {
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
	let minHeap = MinHeap(nums, k)
	return minHeap.peek() ?? 0
}
}

class MinHeap {
	var values = [Int]()
	var limit = Int()

	init(_ nums: [Int], _ k: Int) {
		limit = k
		for num in nums {
			addValue(num)
		}
}

func addValue(_ value: Int) {
	guard !(values.count == limit && peek() ?? 0 > value) else { return }
values.append(value)
if !values.isEmpty {
	bottomUp()
}
if values.count > limit {
	removeTop()
}
}

func bottomUp() {
	var childIndex =  values.count - 1
	while true {
		let parentIndex = (childIndex - 1) / 2
		guard parentIndex >= 0 && parentIndex != childIndex else { break }
		if values[parentIndex] > values[childIndex] {
			swap(parentIndex, childIndex)
			childIndex = parentIndex
} else {
                break
            }
	}
}

func removeTop() {
	guard !values.isEmpty else { return }
	swap(0, values.count - 1)
	values.remove(at: values.count - 1)
	topDown()
}

func topDown() {
		var parent = 0
	
	while true {
		let leftChild = (parent * 2) + 1
		let rightChild = (parent * 2) + 2
		guard leftChild < values.count - 1 else { break }
		if values[leftChild] < values[rightChild] && values[parent] > values[leftChild] {
				swap(parent, leftChild)
				parent = leftChild
} else if values[parent] > values[rightChild] {
				swap(parent, rightChild)
				parent = rightChild
} else {
	break
}
	}

	while true {
		let leftChild = (parent * 2) + 1
		guard leftChild < values.count && parent != leftChild else { break }
		if values[parent] > values[leftChild] {
			swap(parent, leftChild)
			parent = leftChild
} else {
	break
}
}
}

func swap(_ index1: Int, _ index2: Int) {
	guard index1 < values.count && index2 < values.count else { return }
	let temp = values[index1]
	values[index1] = values[index2]
	values[index2] = temp
}

func peek() -> Int? {
	return values.first
}
}

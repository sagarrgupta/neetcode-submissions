class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        func quickSelect(l: Int, r: Int, pivot: Int, k: Int) -> Int {
            
            let pivotNum = nums[pivot]
            swap(r, pivot, &nums)
            var toPlaceAt = l
            for i in l..<r {
                if nums[i] < pivotNum {
                    swap(i, toPlaceAt, &nums)
                    toPlaceAt += 1
                }
            }
            swap(r, toPlaceAt, &nums)
            
            let target = nums.count - k
            if toPlaceAt == target {
                return nums[toPlaceAt]
            } else {
                if toPlaceAt < target {
                    // right
                    return quickSelect(l: toPlaceAt + 1, r: r, pivot: getRandomPivot(toPlaceAt + 1, r), k: k)
                } else {
                    // left
                    return quickSelect(l: l, r: toPlaceAt - 1, pivot: getRandomPivot(l, toPlaceAt - 1), k: k)
                }
            }
        }
        
        return quickSelect(l: 0, r: nums.count - 1, pivot: getRandomPivot(0, nums.count - 1), k: k)
    }

    func getRandomPivot(_ l: Int, _ r: Int) -> Int {
        return Int.random(in: Range<Int>(l...r))
    }

    func swap(_ index1: Int, _ index2: Int, _ nums: inout [Int]) {
        let temp = nums[index1]
        nums[index1] = nums[index2]
        nums[index2] = temp
    }
}

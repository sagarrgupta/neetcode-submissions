class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefixMultiple = Array(repeating: 1, count: nums.count)
        var suffixMultiple = Array(repeating: 1, count: nums.count)
        
        for (index, num) in nums.enumerated() {
            if index == 0 {
                prefixMultiple[index] = num
            } else {
                prefixMultiple[index] = prefixMultiple[index - 1] * num
            }
            
            let suffixIndex = (nums.count - 1) - index
            if suffixIndex == (nums.count - 1) {
                suffixMultiple[suffixIndex] = nums[suffixIndex]
            } else {
                suffixMultiple[suffixIndex] = nums[suffixIndex] * suffixMultiple[suffixIndex + 1]
            }
        }
        
        var newNums = Array(repeating: 1, count: nums.count)
        for (index, num) in nums.enumerated() {
            if index > 0 {
                newNums[index] *= prefixMultiple[index - 1]
            }
            
            if index < (newNums.count - 1) {
                newNums[index] *= suffixMultiple[index + 1]
            }
        }
        return newNums
    }
}

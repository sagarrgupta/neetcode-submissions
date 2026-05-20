class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let nums = Set(nums)
        var maxLength = 0
        for num in nums {
            guard !nums.contains(num - 1) else { continue }
            
            var currentMax = 1
            var currentNum = num
            while true {
                if nums.contains(currentNum + 1) {
                    currentMax += 1
                    currentNum += 1
                } else {
                    break
                }
            }
            
            maxLength = max(maxLength, currentMax)
        }
        return maxLength
    }
}

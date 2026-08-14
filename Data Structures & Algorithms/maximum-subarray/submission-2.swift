class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var maxSeen = nums[0]
        var previous = nums[0]
        
        for i in 1..<nums.count {
            previous = max(previous + nums[i], nums[i])
            maxSeen = max(maxSeen, previous)
        }

        return maxSeen
    }
}

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var maxSeen = Int.min
        var previous = Int.min / 2
        
        for i in 0..<nums.count {
            previous = max(previous + nums[i], nums[i])
            maxSeen = max(maxSeen, previous)
        }

        return maxSeen
    }
}

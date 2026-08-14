class Solution {
    func jump(_ nums: [Int]) -> Int {
        var dp = Array(repeating: nums.count, count: nums.count)
        dp[nums.count - 1] = 0
        var end = nums.count - 1
        
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            if nums[i] == 0 { continue }
            
            if nums[i] + i >= end {
                dp[i] = 1
            } else {
                dp[i] = min(1 + dp[i + 1], 1 + dp[nums[i] + i])
            }
        }
        
        return dp[0]
    }
}

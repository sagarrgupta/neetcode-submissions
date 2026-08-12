// 3:40
class Solution {
    func canPartition(_ nums: [Int]) -> Bool {
        var total = nums.reduce(0) {
            $0 + $1
        }
        guard total % 2 == 0 else { return false }
        
        var target = total / 2
        var dp = Array(repeating: false, count: target + 1)
        dp[0] = true
        
        for num in nums {
            for dpIndex in stride(from: target - num, through: 0, by: -1) {
                if dp[dpIndex] {
                    let sum = dpIndex + num
                    dp[sum] = true
                }
            }
        }
        
        return dp[target]
    }
}

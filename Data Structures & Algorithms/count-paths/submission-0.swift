// 8:07
class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        for row in 1..<m {
            for column in 1..<n {
                dp[row][column] = dp[row-1][column] + dp[row][column-1]
            }
        }
        return dp[m-1][n-1]
    }
}

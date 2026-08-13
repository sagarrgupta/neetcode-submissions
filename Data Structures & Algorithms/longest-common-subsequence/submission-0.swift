// 10: 07
class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
        var row = Array(text1)
        var column = Array(text2)
        
        var dp = Array(repeating: Array(repeating: 0, count: column.count + 1), count: row.count + 1)
        
        for r in 1...row.count {
            for c in 1...column.count {
                if row[r - 1] == column[c - 1] {
                    dp[r][c] = 1 + dp[r-1][c-1]
                } else {
                    dp[r][c] = max(dp[r-1][c], dp[r][c-1])
                }
            }
        }
        
        return dp[row.count][column.count]
    }
}

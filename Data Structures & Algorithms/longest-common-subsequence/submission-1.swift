class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        
        var row = Array(text1)
        var column = Array(text2)
        var dp = Array(repeating: 0, count: column.count + 1)
        
        for r in 1...row.count {
            var temp = dp
            for c in 1...column.count {
                if row[r - 1] == column[c - 1] {
                    temp[c] = 1 + dp[c-1]
                } else {
                    temp[c] = max(dp[c], temp[c-1])
                }
            }
            dp = temp
        }
        
        return dp[column.count]
    }
}

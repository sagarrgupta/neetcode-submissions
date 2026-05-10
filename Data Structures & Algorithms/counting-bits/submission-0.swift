class Solution {
    func countBits(_ n: Int) -> [Int] {
        var dp = Array(repeating: 0, count: n + 1)
        if n == 0 { return dp }
        
        var offset = 1
        dp[1] = 1
        if n == 1 { return dp }
        
        for i in 2...n {
            let power = 2 * offset
            if i == power {
                offset = power
            }
            dp[i] = 1 + dp[i - offset]
        }
        
        return dp
    }
}

// 6:00
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        guard !coins.isEmpty else { return -1 }
        let coins = coins.sorted { $0 < $1 }
        
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        for remainingAmount in 1...amount {
            for coin in coins {
                if coin <= remainingAmount {
                    dp[remainingAmount] = min(dp[remainingAmount], dp[remainingAmount - coin] + 1)
                }
            }
        }
        
        return dp[amount] > amount ? -1 : dp[amount]
    }
}

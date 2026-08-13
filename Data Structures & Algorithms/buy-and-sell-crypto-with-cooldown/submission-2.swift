
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var dp = Array(repeating: [0, 0], count: prices.count + 2)
        
        for index in stride(from: prices.count - 1, through: 0, by: -1) {
            let buyAndSellOrRest = max((-prices[index] + dp[index + 1][1]), dp[index + 1][0])
            let sellToday = max((prices[index] + dp[index + 2][0]), dp[index + 1][1])
            dp[index] = [buyAndSellOrRest, sellToday]
        }
        return dp[0][0]
    }
}

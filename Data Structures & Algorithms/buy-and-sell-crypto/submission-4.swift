class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 { return 0 }
        var buyIndex = 0
        var sellIndex = 1
        var maxProfit = 0
        
        while sellIndex < prices.count {
            if prices[sellIndex] <= prices[buyIndex] {
                buyIndex = sellIndex
                sellIndex += 1
            } else {
                maxProfit = max(maxProfit, prices[sellIndex] - prices[buyIndex])
                sellIndex += 1
            }
        }
        return maxProfit
    }
}

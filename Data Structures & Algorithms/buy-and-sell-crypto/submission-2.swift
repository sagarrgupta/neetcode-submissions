class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPriceSeen = -1
        var maxPriceSeen = -1
        var maxProfit = 0
        
        for price in prices {
            if minPriceSeen == -1 || price < minPriceSeen {
                minPriceSeen = price
                maxPriceSeen = -1
            }
            
            if minPriceSeen != -1 && price > maxPriceSeen {
                maxPriceSeen = price
            }
            
            if maxPriceSeen != -1 {
                let currentMax = maxPriceSeen - minPriceSeen
                if currentMax > maxProfit { maxProfit = currentMax }
            }
        }
        
        return maxProfit
    }
}

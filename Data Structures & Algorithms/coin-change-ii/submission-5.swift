// 2:02
class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 else { return 1 }
        var memo = [[Int]: Int]()
        
        func backtracking(index: Int, remainingSum: Int) -> Int {
            let key = [index, remainingSum]
            
            guard index < coins.count else {
                memo[key] = 0
                return 0
            }
            
            if let value = memo[key] {
                return value
            }
            
            var variationFromCurrentIndex = 0
            
            // consider current number
            if coins[index] <= remainingSum {
                let currentRemainingSum = remainingSum - coins[index]
                
                if currentRemainingSum == 0 {
                    variationFromCurrentIndex += 1
                } else {
                    variationFromCurrentIndex += backtracking(index: index, remainingSum: currentRemainingSum)
                }
            }
            
            // skip current number
            variationFromCurrentIndex += backtracking(index: index + 1, remainingSum: remainingSum)
            
            memo[key] = variationFromCurrentIndex
            return variationFromCurrentIndex
        }
        
        return backtracking(index: 0, remainingSum: amount)
    }
}

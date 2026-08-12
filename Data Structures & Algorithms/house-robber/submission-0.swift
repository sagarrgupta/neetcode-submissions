// 10:53
class Solution {
    func rob(_ nums: [Int]) -> Int {
        var twoBack = 0
        var oneBack = 0
        
        for money in nums {
            let current = max(twoBack + money, oneBack)
            
            twoBack = oneBack
            oneBack = current
        }
        return oneBack
    }
}

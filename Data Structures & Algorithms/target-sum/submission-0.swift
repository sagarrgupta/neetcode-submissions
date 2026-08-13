// 3:15
class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var memo = [[Int]: Int]()
        
        func backTracking(_ index: Int, _ currentSum: Int) -> Int {
            guard index < nums.count else {
                return currentSum == target ? 1 : 0
            }
            
            let key = [index, currentSum]
            if let value = memo[key] {
                return value
            }
            
            // positive
            var toReturn = backTracking(index + 1, currentSum + nums[index])
            
            // negative
            toReturn += backTracking(index + 1, currentSum - nums[index])
            
            memo[key] = toReturn
            return toReturn
        }
        
        return backTracking(0, 0)
    }
}

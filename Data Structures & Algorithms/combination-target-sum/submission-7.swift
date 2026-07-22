class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()
        var sets = [[Int]]()
        var currentSet = [Int]()
        var currentSum = 0
        
        func dfs(_ i: Int) {
            if currentSum == target {
                sets.append(currentSet)
                return
            }
            
            if currentSum > target || i >= nums.count {
                return
            }
            
            currentSum += nums[i]
            currentSet.append(nums[i])
            dfs(i)
            
            // let toStopCheckingMore = currentSum > target
            currentSum -= nums[i]
            currentSet.removeLast()
            dfs(i+1)
        }
        
        dfs(0)
        
        return sets
    }
}

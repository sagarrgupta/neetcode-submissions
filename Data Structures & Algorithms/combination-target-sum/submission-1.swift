class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var sets = [[Int]]()
        var currentSet = [Int]()
        var currentSum = 0
        
        func dfs(_ i: Int) {
            if currentSum == target {
                sets.append(currentSet)
                return
            }
            
            if currentSum > target {
                return
            }
            
            guard i < nums.count else { return }
            currentSum += nums[i]
            currentSet.append(nums[i])
            dfs(i)
            if currentSum > target {
                currentSum -= nums[i]
                currentSet.removeLast()
                dfs(i+1)
            } else {
                currentSum -= nums[i]
                currentSet.removeLast()
                dfs(i+1)
            }
        }
        
        dfs(0)
        
        return sets
    }
}

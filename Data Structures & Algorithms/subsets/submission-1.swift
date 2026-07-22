class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var sets = [[Int]]()
        
        var currentSet = [Int]()
        
        func dfs(_ i: Int) {
            if i >= nums.count {
                sets.append(currentSet)
                return
            }
            
            currentSet.append(nums[i])
            dfs(i + 1)
            currentSet.removeLast()
            dfs(i + 1)
        }
        
        dfs(0)
        
        return sets
    }
}

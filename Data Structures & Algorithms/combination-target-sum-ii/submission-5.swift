class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        var sets = [[Int]]()
        var currentSet = [Int]()
        
        func dfs(_ i: Int, _ total: Int) {
            if total == target {
                sets.append(currentSet)
                return
            }
            
            if total > target || i >= candidates.count {
                return
            }
            
            let newTotal = total + candidates[i]
            currentSet.append(candidates[i])
            dfs(i + 1, newTotal)
            
            
            let toContinue = newTotal <= target
            currentSet.removeLast()
            
            var nextIndex = i + 1
            while nextIndex < candidates.count,
                candidates[i] == candidates[nextIndex] {
                nextIndex += 1
            }
            
            if toContinue {
                dfs(nextIndex, total)
            }
        }
        
        dfs(0, 0)
        
        return sets
    }
}

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var currentList = [Int]()
        var nums = nums.sorted()
        
        func chooseSubset(i: Int) {
            guard i < nums.count else {
                result.append(currentList)
                return
            }
            
            currentList.append(nums[i])
            chooseSubset(i: i+1)
            
            var newI = i
            while newI < (nums.count - 1) {
                if nums[newI] == nums[newI + 1] {
                    newI += 1
                } else {
                    break
                }
            }
            
            currentList.popLast()
            chooseSubset(i: newI + 1)
        }
        
        chooseSubset(i: 0)
        
        return result
    }
}

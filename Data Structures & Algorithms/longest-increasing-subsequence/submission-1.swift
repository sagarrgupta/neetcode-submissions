class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var lastNumberAdded = Int.min
        var memo = [[Int]: Int]() // 0 = index checking, 1 = last number added
        
        func backtrack(index: Int) -> Int {
            guard index < nums.count else {
                return 0
            }
            
            if let value = memo[[index, lastNumberAdded]] {
                return value
            }

            let tempLastNumber = lastNumberAdded
            let numberToAdd = nums[index]
            var maxValueCanBeTaken = 0
            
            if numberToAdd > lastNumberAdded {
                lastNumberAdded = numberToAdd
                
                maxValueCanBeTaken = max(1 + backtrack(index: index + 1), maxValueCanBeTaken)
                lastNumberAdded = tempLastNumber
                
                maxValueCanBeTaken = max(backtrack(index: index + 1), maxValueCanBeTaken)
            } else {
                maxValueCanBeTaken = max(backtrack(index: index + 1), maxValueCanBeTaken)
            }
            
            memo[[index, tempLastNumber]] = maxValueCanBeTaken
            return maxValueCanBeTaken
        }
        
        return backtrack(index: 0)
    }
}

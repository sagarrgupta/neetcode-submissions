class Solution {
    func jump(_ nums: [Int]) -> Int {
        var farthest = 0
        var currentEnd = 0
        var steps = 0
        
        for i in 0..<nums.count - 1 {
            farthest = max(farthest, nums[i] + i)
            
            if i == currentEnd {
                steps += 1
                currentEnd = farthest
            }
        }
        
        return steps
    }
}

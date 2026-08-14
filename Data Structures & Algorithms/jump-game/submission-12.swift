// 10:00
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var farthest = 0
        var goal = nums.count-1

        for i in 0..<goal {
            if i > farthest {
                return false
            }
            
            farthest = max(nums[i] + i, farthest)

            if farthest >= goal {
                return true
            }
        }

        return farthest == goal
    }
}

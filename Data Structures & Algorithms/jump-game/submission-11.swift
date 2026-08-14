// 10:00
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var farthest = 0
        var goal = nums.count-1

        for i in 0..<goal {
            if i > farthest {
                return false
            }

            let current = nums[i] + i
            if current > farthest {
                farthest = current
            }

            if farthest >= nums.count-1 {
                return true
            }
        }

        return farthest == goal
    }
}

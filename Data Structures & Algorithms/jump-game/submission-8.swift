// 10:00
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var goal = nums.count - 1

        for i in stride(from: goal - 1, through: 0, by: -1) {
            if nums[i] + i >= goal {
                goal = i
            }
        }

        return goal == 0
    }
}

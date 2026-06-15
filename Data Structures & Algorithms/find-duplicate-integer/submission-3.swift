class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var slowPointer = nums[0]
        var fastPointer = nums[nums[0]]
        
        while slowPointer != fastPointer {
            slowPointer = nums[slowPointer]
            fastPointer = nums[nums[fastPointer]]
        }
        
        var slow2 = 0
        
        while slow2 != slowPointer {
            slow2 = nums[slow2]
            slowPointer = nums[slowPointer]
        }
        
        return slow2
    }
}

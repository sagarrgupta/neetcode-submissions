// 11:12
class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 2 else {
            if nums.count > 1 {
                return max(nums[0], nums[1])
            } else {
                return nums.first ?? 0
            }
        }
            
        var twoBackWithoutEnd = 0
        var oneBackWithoutEnd = 0
        
        for money in 1..<nums.count {
            let current = max(oneBackWithoutEnd, twoBackWithoutEnd + nums[money])
            twoBackWithoutEnd = oneBackWithoutEnd
            oneBackWithoutEnd = current
        }
        
        var twoBackWithEnd = 0
        var oneBackWithEnd = 0
        
        for money in 0..<nums.count-1 {
            let current = max(oneBackWithEnd, twoBackWithEnd + nums[money])
            twoBackWithEnd = oneBackWithEnd
            oneBackWithEnd = current
        }
        
        return max(oneBackWithoutEnd, oneBackWithEnd)
    }
}

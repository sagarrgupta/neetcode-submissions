class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        
        var mid = 0
        while l < r {
            mid = ((r - l) / 2) + l
            let currentNum = nums[mid]
            let rightEnd = nums[r]
            
            if currentNum > rightEnd {
                l = mid + 1
            } else {
                r = mid
            }
        }
        
        return nums[l]
    }
}

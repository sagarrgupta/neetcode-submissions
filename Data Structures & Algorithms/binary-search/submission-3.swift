class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty ||
            target < nums.first ?? 0 ||
            target > nums.last ?? 0 { return -1 }
        
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if nums[mid] == target {
                return mid
            } else if target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
}

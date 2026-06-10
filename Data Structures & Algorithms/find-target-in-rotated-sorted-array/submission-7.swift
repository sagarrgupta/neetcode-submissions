class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        
        while l <= r {
            let mid = ((r - l) / 2) + l
            let midNum = nums[mid]
            let leftEnd = nums[l]
            let rightEnd = nums[r]
            
            if target == midNum { return mid }
            
            if leftEnd <= midNum {
                if target < midNum && target >= leftEnd {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else {
                if target > midNum && target <= rightEnd {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        return -1
    }
}

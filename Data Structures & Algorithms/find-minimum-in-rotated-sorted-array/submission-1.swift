class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1
        let lastElement = nums.count
        var currentSmallest: Int?
        
        var mid = 0
        while l <= r {
            mid = ((r - l) / 2) + l
            print(l, mid, r)
            let leftEnd = nums[l]
            let currentNum = nums[mid]
            let rightEnd = nums[r]
            currentSmallest = min(currentSmallest ?? currentNum, currentNum)
            
            if leftEnd >= currentNum && rightEnd >= currentNum {
                r = mid - 1
            } else if leftEnd <= currentNum && rightEnd <= currentNum {
                l = mid + 1
            } else if leftEnd > currentNum && rightEnd < currentNum {
                print("invalid")
                break
            } else if leftEnd < currentNum && rightEnd > currentNum {
                r = mid - 1
            }
        }
        
        return currentSmallest ?? 0
    }
}

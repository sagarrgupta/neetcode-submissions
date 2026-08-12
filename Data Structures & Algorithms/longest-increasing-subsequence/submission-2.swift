class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var tails = [Int]()
        
        for num in nums {
            if let value = binarySearch(num) {
                tails[value] = num
            } else {
                tails.append(num)
            }
            print(tails)
        }
        
        func binarySearch(_ numberToSearch: Int) -> Int? {
            var left = 0
            var right = tails.count
            
            while left < right {
                let mid = ((right - left) / 2) + left
                if tails[mid] < numberToSearch {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left < tails.count ? left : nil
        }
        
        return tails.count
    }
}

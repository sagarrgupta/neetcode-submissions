class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var set: [[Int]] = [[Int]]()
        let sorted = nums.sorted()
        for (index, num) in sorted.enumerated() {
            
            if index > 0 && num == sorted[index - 1] {
                continue
            }
            
            var left = index + 1
            var right = nums.count - 1
            
            while left < right {
                let sum = sorted[left] + sorted[right]
                if sum == -num {
                    set.append([num, sorted[left], sorted[right]])
                    left += 1
                    right -= 1
                    
                    while left < right && sorted[left] == sorted[left - 1] {
                        left += 1
                    }
                    
                    while left < right && sorted[right] == sorted[right + 1] {
                        right -= 1
                    }
                } else if sum < -num {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return set
    }
}

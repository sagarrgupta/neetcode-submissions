class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        dict.reserveCapacity(nums.count)
        
        for (index, num) in nums.enumerated() {
            let diff = target - num
            if let value = dict[diff] {
                return [value, index]
            } else {
                dict[num] = index
            }
        }
        return []
    }
}

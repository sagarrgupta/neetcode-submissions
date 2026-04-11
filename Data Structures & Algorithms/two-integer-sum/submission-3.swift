class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for (index, num) in nums.enumerated() {
            if let value = dict[target - num] {
                return [value, index]
            } else {
                dict[num] = index
            }
        }
        return []
    }
}

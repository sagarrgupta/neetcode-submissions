class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var result = 0
        for i in 0...nums.count {
            result ^= i
        }
        nums.forEach {
            result ^= $0
        }
        return result
    }
}

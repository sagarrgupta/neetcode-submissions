class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var result = nums[0]
        var currentMax = result
        var currentMin = result
        
        for i in 1..<nums.count {
            let currentCalculation = (nums[i],
                                    nums[i] * currentMax,
                                    nums[i] * currentMin)
            currentMax = max(currentCalculation.0,
                            currentCalculation.1,
                            currentCalculation.2)
            currentMin = min(currentCalculation.0,
                            currentCalculation.1,
                            currentCalculation.2)
            result = max(currentMax, result)
        }
        
        return result
    }
}

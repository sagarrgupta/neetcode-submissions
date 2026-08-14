class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        func divideAndConquer(left: Int, right: Int) -> Int {
            guard left != right else { return nums[left] }
            let mid = ((right - left) / 2) + left
            let leftSum = divideAndConquer(left: left, right: mid)
            let rightSum = divideAndConquer(left: mid + 1, right: right)
            
            var bestCrossLeft = Int.min
            var crossLeft = 0
            
            var bestCrossRight = Int.min
            var crossRight = 0
            
            for i in stride(from: mid, through: left, by: -1) {
                crossLeft += nums[i]
                bestCrossLeft = max(bestCrossLeft, crossLeft)
            }
            
            for i in (mid + 1)...right {
                crossRight += nums[i]
                bestCrossRight = max(bestCrossRight, crossRight)
            }
            
            return max(leftSum, rightSum, bestCrossLeft + bestCrossRight)
        }
        
        return divideAndConquer(left: 0, right: nums.count - 1)
    }
}

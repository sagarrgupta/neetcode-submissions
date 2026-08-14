class Solution {
    func jump(_ nums: [Int]) -> Int {
        var steps = 0
        
        var farthest = 0
        var l = 0
        var r = 0
        
        while r < nums.count - 1 {
            print(l,r)
            for i in l...r {
                let currentLimit = min(nums[i] + i, nums.count - 1)
                farthest = max(farthest, currentLimit)
            }
            l = r+1
            r = farthest
            steps += 1
        }
        
        return steps
    }
}

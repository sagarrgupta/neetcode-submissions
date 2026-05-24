class Solution {
    func maxArea(_ heights: [Int]) -> Int  {
        var left = 0
        var right = heights.count - 1
        var maxa = 0
        
        while left < right {
            let lValue = heights[left]
            let rValue = heights[right]
            let currentMax = min(lValue, rValue) * (right - left)
            maxa = max(currentMax, maxa)
            if heights[left] < heights[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxa
    }
}

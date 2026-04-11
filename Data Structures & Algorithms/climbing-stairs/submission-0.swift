class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return n }
        var step1 = 1
        var step2 = 2
        for i in 2..<n {
            let new = step2 + step1
            step1 = step2
            step2 = new
        }
        return step2
    }
}

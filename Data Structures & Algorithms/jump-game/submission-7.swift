// 10:00
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var memo = [Int: Bool]()
        
        func jump(_ from: Int) -> Bool {
            guard from < nums.count - 1 else { return true }
            if let value = memo[from] {
                return value
            }
            
            let nextJumpLimit = from + nums[from]
            
            for i in stride(from: nextJumpLimit, to: from, by: -1) {
                if jump(i) {
                    return true
                }
            }
            memo[from] = false
            return false
        }
        
        return jump(0)
    }
}

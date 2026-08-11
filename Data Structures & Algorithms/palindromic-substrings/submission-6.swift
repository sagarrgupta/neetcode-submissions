// 10:55
class Solution {
    func countSubstrings(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let chars = Array(s)
        var memo = Array(repeating:
                            Array(repeating: false, count: chars.count),
                        count: chars.count)
        
        var totalCount = 0
        
        for length in 1...s.count {
            for i in 0...s.count - length {
                let j = i + length - 1
                if chars[i] == chars[j] &&
                    (length <= 2 || memo[i + 1][j - 1]) {
                    memo[i][j] = true
                    totalCount += 1
                }
            }
        }
        
        return totalCount
    }
}

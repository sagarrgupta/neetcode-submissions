class Solution {
    func partition(_ s: String) -> [[String]] {
        var chars = Array(s)
        var dp = Array(repeating: [[String]](), count: s.count + 1)
        dp[0] = [[]]
        
        for end in 0..<chars.count {
            for start in 0...end {
                let subString = Array(chars[start...end])
                if !checkIfPalindrome(subString) {
                    continue
                }
                
                for previousPalindrome in dp[start] {
                    var new = previousPalindrome
                    new.append(String(subString))
                    dp[end + 1].append(new)
                }
            }
        }
        
        return dp.last ?? [[String]]()
    }

    func checkIfPalindrome(_ s: [Character]) -> Bool {
        guard !s.isEmpty else { return true }
        
        var left = 0
        var right = (s.count - 1)
        
        while left < right {
            if s[left] != s[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}

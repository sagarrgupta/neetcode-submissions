class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        var s1Chars = Array(s1)
        var s2Chars = Array(s2)
        var s3Chars = Array(s3)
        
        guard s1Chars.count + s2Chars.count == s3Chars.count else { return false }
        
        var memo = [[Int] : Bool]()
        
        func backtrack(s1Index: Int, s2Index: Int) -> Bool {
            let key = [s1Index, s2Index]
            
            if let value = memo[key] {
                return value
            }
            
            let currentlyChecking = s1Index + s2Index
            guard currentlyChecking < s3Chars.count else {
                memo[key] = true
                return true
            }
            let toCheck = s3Chars[currentlyChecking]
            
            var s1Char: Character?
            var s2Char: Character?
            
            if s1Index < s1Chars.count {
                s1Char = s1Chars[s1Index]
            }
            
            if s2Index < s2Chars.count {
                s2Char = s2Chars[s2Index]
            }
            
            if s1Char == s2Char && s1Char == toCheck {
                if let s1Char = s1Char {
                    if backtrack(s1Index: s1Index + 1, s2Index: s2Index) { return true }
                }
                
                if let s2Char = s2Char {
                    if backtrack(s1Index: s1Index, s2Index: s2Index + 1) { return true }
                }
            } else {
                if let s1Char = s1Char, s1Char == toCheck {
                    if backtrack(s1Index: s1Index + 1, s2Index: s2Index) { return true }
                }
                
                if let s2Char = s2Char, s2Char == toCheck {
                    if backtrack(s1Index: s1Index, s2Index: s2Index + 1) { return true }
                }
            }
            
            memo[key] = false
            return false
        }
        
        return backtrack(s1Index: 0, s2Index: 0)
    }
}

// 1:01
class Solution {
    func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var isPalindrome = Array(repeating: Array(repeating: false, count: chars.count), count: chars.count)
        var longestPalindrome = [Int]()
        
        for length in 1...chars.count {
            for i in 0...s.count - length {
                let j = i + length - 1
                
                if chars[i] == chars[j] && ((j-i <= 2) || isPalindrome[i+1][j-1]) {
                    isPalindrome[i][j] = true
                    longestPalindrome = [i,j]
                }
            }
        }
        
        return String(chars[longestPalindrome[0]...longestPalindrome[1]])
    }
}

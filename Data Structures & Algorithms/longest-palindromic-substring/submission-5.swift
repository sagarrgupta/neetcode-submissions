class Solution {
    func longestPalindrome(_ s: String) -> String {
        func manacherAlgo() -> String {
            let tempS = "#" + s.map({ "\($0)#" }).joined()
            let chars = Array(tempS)
            var pCount = Array(repeating: 0, count: chars.count)
            var l = 0
            var r = 0
            var longestPalindromeL = 0
            var longestPalindromeR = 0
            
            for i in 0..<chars.count {
                if i < r {
                    pCount[i] = min(pCount[l + (r - i)], r - i)
                }
                
                while (i - pCount[i] - 1) >= 0,
                    (i + pCount[i] + 1) < chars.count,
                    chars[i - pCount[i] - 1] == chars[i + pCount[i] + 1] {
                    pCount[i] += 1
                }
                
                if (i + pCount[i]) > r {
                    l = i - pCount[i]
                    r = i + pCount[i]
                }
                
                if (r - l + 1) > (longestPalindromeR - longestPalindromeL + 1) {
                    longestPalindromeL = l
                    longestPalindromeR = r
                }
            }
            return String(chars[longestPalindromeL...longestPalindromeR]).replacingOccurrences(of: "#", with: "")
        }

        return manacherAlgo()
    }
}

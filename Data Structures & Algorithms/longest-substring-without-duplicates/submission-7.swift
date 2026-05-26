class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map = [Character: Int]()
        var maxLength = 0
        
        var l = 0
        var r = 0
        
        for (index, char) in s.enumerated() {
            if let i = map[char], i >= l {
                l = i + 1
            }
            
            map[char] = index
            let currentLength = (r - l) + 1
            maxLength = max(maxLength, currentLength)
            r += 1
        }
        return maxLength
    }
}

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var set = [Character]()
        var maxLength = 0
        for char in s {
            if set.contains(char),
                let index = set.firstIndex(of: char) {
                set.removeSubrange(0...index)
                set.append(char)
            } else {
                set.append(char)
            }
            maxLength = max(maxLength, set.count)
        }
        return maxLength
    }
}

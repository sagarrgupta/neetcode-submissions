class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var s = Array(s)
        var map = [Character: Int]()
        var characterHoldingMaxCount = 0
        var maxLengthPossible = 0
        var l = 0
        var r = 0
        
        for char in s {
            map[char, default: 0] += 1
            characterHoldingMaxCount = max(characterHoldingMaxCount, map[char] ?? 0)
            
            let windowLength = r - l + 1
            
            if windowLength - characterHoldingMaxCount > k {
                let charToDecrease = s[l]
                map[charToDecrease, default: 0] -= 1
                l += 1
            } else {
                maxLengthPossible = windowLength
            }
            r += 1
        }
        return maxLengthPossible
    }
}

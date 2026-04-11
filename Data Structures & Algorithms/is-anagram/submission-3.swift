class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        var dict = [Character: Int]()
        dict.reserveCapacity(min(26, s.count))
        
        for (c1, c2) in zip(s, t) {
            dict[c1, default: 0] += 1
            dict[c2, default: 0] -= 1
        }
        
        for (_, value) in dict {
            if value != 0 { return false }
        }
        
        return true
    }
}

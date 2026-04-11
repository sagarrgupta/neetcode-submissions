class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        
        var dict = [Character: Int]()
        dict.reserveCapacity(min(26, s.count))
        
        for character in s {
            if let value = dict[character] {
                dict[character] = value + 1
            } else {
                dict[character] = 1
            }
        }
        
        for character in t {
            if let value = dict[character] {
                if value == 1 {
                    dict.removeValue(forKey: character)
                    continue
                }
                dict[character] = value - 1
            }
        }
        
        return dict.isEmpty
    }
}

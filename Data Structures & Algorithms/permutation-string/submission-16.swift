class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2)
        
        
        var need = [Character: Int]()
        need.reserveCapacity(s1.count)
        var window = [Character: Int]()
        need.reserveCapacity(s1.count + 1)
        
        for char in s1 {
            need[char, default: 0] += 1
        }
        
        let windowSize = s1.count
        
        for (index, char) in s2.enumerated() {
            window[char, default: 0] += 1
            
            if index >= windowSize {
                let leftChar = s2[index - windowSize]
                window[leftChar]! -= 1
                if window[leftChar] == 0 {
                    window.removeValue(forKey: leftChar)
                }
            }
            
            if window == need {
                return true
            }
        }
        
        return false
    }
}

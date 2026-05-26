class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s1Count = s1.count - 1
        let s2Count = s2.count
        
        var map = [Character: Int]()
        for char in s1 {
            map[char, default: 0] += 1
        }
        
        for (index, char) in s2.enumerated() {
            let toIndex = index + s1Count
            guard s1.contains(char),
                toIndex < s2Count else { continue }
            
            var tempMap = map
            for i in index...toIndex {
                tempMap[s2[i], default: 0] -= 1
            }
            
            var isValid = true
            for value in tempMap.values {
                if value != 0 {
                    isValid = false
                    break
                }
            }
            if isValid { return true }
        }
        
        return false
    }
}

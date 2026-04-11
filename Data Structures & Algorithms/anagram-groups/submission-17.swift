class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [[Int]: [String]] = [:]
    
        for str in strs {
            var key = Array(repeating: 0, count: 26)
            for byte in str.utf8 {
                key[Int(byte - 97 + 1)] += 1
            }
            dict[key, default: []].append(str)
        }
        
        return Array(dict.values)
    }
}

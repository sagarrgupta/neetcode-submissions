class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [[Int]: [String]] = [:]
        
        for str in strs {
            var count = Array(repeating: 0, count: 26)
            
            for byte in str.utf8 {
                count[Int(byte - 97)] += 1
            }
            
            dict[count, default: []].append(str)
        }
        
        return Array(dict.values)
    }
}

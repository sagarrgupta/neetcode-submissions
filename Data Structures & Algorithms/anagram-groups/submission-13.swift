class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
    
        for str in strs {
            let sorted = String(str.sorted())
            dict[sorted, default: []].append(str)
        }
        
        return Array(dict.values)
    }
}

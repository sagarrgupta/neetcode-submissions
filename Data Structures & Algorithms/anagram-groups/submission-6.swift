class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        for str in strs {
            let sorted = "\(str.sorted())"
            if let value = dict[sorted] {
                dict[sorted, default: []].append(str)
            } else {
                dict[sorted] = [str]
            }
        }
        
        return Array(dict.values)
    }
}

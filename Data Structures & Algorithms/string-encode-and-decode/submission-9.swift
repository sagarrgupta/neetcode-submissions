class Solution {
    func encode(_ strs: [String]) -> String {
        var encoded = ""
        for str in strs {
            encoded += "\(str.count):\(str)"
        }
        return encoded
    }

    func decode(_ str: String) -> [String] {
        var str = str
        var array = [String]()
        
        while !str.isEmpty {
            if let range = str.firstIndex(of: ":") {
                let position = str.distance(from: str.startIndex, to: range)
                let currentCount = str.prefix(position)
                let convertedCount = Int(currentCount) ?? 0
                str.removeSubrange(str.startIndex...range)
                
                let endIndex = str.index(str.startIndex, offsetBy: convertedCount)
                array.append(String(str.prefix(convertedCount)))
                str.removeSubrange(str.startIndex..<endIndex)
            }
            
        }
        return array
    }
}

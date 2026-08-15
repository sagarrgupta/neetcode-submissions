class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        var toReturn = [Int]()
        var currentSize = 0
        var currentStart = 0
        var hashmap = [Character: Int]()
        
        for (index, char) in s.enumerated() {
            hashmap[char] = index
        }
        
        for (index, char) in s.enumerated() {
            if let lastIndex = hashmap[char] {
                currentSize = max(currentSize, lastIndex)
            }
            if index == currentSize {
                toReturn.append(currentSize - currentStart + 1)
                currentStart = index + 1
            }
        }
        
        return toReturn
    }
}

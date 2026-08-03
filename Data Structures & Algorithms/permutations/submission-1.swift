class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        
        var currentList = [Int]()
        var choicesAvailable = nums
        
        func pickOrNotPick() {
            if choicesAvailable.isEmpty {
                results.append(currentList)
                return
            }
            for (index, num) in choicesAvailable.enumerated() {
                currentList.append(num)
                choicesAvailable.remove(at: index)
                
                pickOrNotPick()
                
                if let element = currentList.popLast() {
                    choicesAvailable.insert(element, at: index)
                }
            }
        }
        
        pickOrNotPick()
        
        return results
    }
}

// 9:25
class Solution {
    func numDecodings(_ s: String) -> Int {
        var alphabets = Set(1...26)
        var characters = Array(s)
        
        var waysToInterpret = 0
        var currentSet = ""
        var count = 0
        var memo = [Int: Int]()
        
        func backtrack(_ index: Int) -> Int {
            count += 1
            guard index < characters.count else {
                return 1
            }
            var numberOfWaysPossibleFromHere = 0
            
            let current = "\(characters[index])"
            if alphabets.contains(Int(current) ?? 0) {
                currentSet.append(current)
            } else {
                return numberOfWaysPossibleFromHere
            }
            if memo[index + 1] == nil {
                numberOfWaysPossibleFromHere += backtrack(index + 1)
                memo[index + 1] = numberOfWaysPossibleFromHere
            } else {
                numberOfWaysPossibleFromHere += memo[index + 1, default: 0]
            }
            currentSet.removeLast()
            
            
            if index + 1 < characters.count {
                let newCurrent = "\(characters[index])\(characters[index+1])"
                if alphabets.contains(Int(newCurrent) ?? 0) {
                    currentSet.append(newCurrent)
                } else {
                    return numberOfWaysPossibleFromHere
                }
                if memo[index + 2] == nil {
                    numberOfWaysPossibleFromHere += backtrack(index + 2)
                    memo[index + 2] = numberOfWaysPossibleFromHere
                } else {
                    numberOfWaysPossibleFromHere += memo[index + 2, default: 0]
                }
                currentSet.removeLast()
                currentSet.removeLast()
            }
            return numberOfWaysPossibleFromHere
        }

        return backtrack(0)
    }
}

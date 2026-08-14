// 7:55
class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        var word1 = Array(word1)
        var word2 = Array(word2)
        var memo = [[Int]: Int]()
        
        func backtrack(index1: Int, index2: Int) -> Int {
            
            let key = [index1, index2]
            
            if let value = memo[key] {
                return value
            }
            print(key)
            
            if index1 >= word1.count {
                return word2.count - index2 // insertion
            }
            
            if index2 >= word2.count {
                return word1.count - index1 // deletion
            }
            
            var minDistanceFromHere = 0
            if word2[index2] == word1[index1] {
                minDistanceFromHere = backtrack(index1: index1 + 1, index2: index2 + 1)
            } else {
                minDistanceFromHere = 1 + min(backtrack(index1: index1 + 1, index2: index2),
                                            backtrack(index1: index1, index2: index2 + 1),
                                            backtrack(index1: index1 + 1, index2: index2 + 1))
            }
            
            memo[key] = minDistanceFromHere
            return minDistanceFromHere
        }
        
        return backtrack(index1: 0, index2: 0)
    }
}

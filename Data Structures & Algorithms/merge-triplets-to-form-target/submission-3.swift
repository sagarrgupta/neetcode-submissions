// 6:17
class Solution {
    func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
        var found = 0
        var samePowerFound = [0, 0, 0]
        
        for triplet in triplets {
            if triplet[0] > target[0] {
                continue
            }
            if triplet[1] > target[1] {
                continue
            }
            if triplet[2] > target[2] {
                continue
            }
            
            if triplet[0] == target[0] {
                samePowerFound[0] = 1
            }
            
            if triplet[1] == target[1] {
                samePowerFound[1] = 1
            }
            
            if triplet[2] == target[2] {
                samePowerFound[2] = 1
            }
            
            if triplet == target {
                return true
            }
            
            found += 1
            if found > 1 {
                var toReturn = true
                for equalFound in samePowerFound {
                    if equalFound == 0 {
                        toReturn = false
                    }
                }
                if toReturn { return true }
            }
        }
        
        return false
    }
}

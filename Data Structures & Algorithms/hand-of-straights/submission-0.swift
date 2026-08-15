// 5:40
class Solution {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        let hand = hand.sorted()
        var hashmap = [Int: Int]()
        
        for num in hand {
            hashmap[num, default: 0] += 1
        }
        
        for num in hand {
            if (hashmap[num] ?? 0) > 0 {
                for i in num..<num+groupSize {
                    if let value = hashmap[i], value > 0 {
                        hashmap[i]! -= 1
                    } else {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}

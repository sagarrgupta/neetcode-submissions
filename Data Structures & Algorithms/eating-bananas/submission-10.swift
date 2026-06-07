class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1
        var r = piles.max() ?? 1
        var answer = r
        
        while l <= r {
            let mid = ((r - l) / 2) + l
            var count = 0
            
            for pile in piles {
                count += (pile + mid - 1) / mid
                
                if count > h { break }
            }
            
            if count > h {
                l = mid + 1
            } else {
                answer = mid
                r = mid - 1
            }
        }
        
        return answer
    }
}

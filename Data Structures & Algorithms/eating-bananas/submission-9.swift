class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var l = 1
        var r = piles.max() ?? 1
        
        var mid = 0
        var previousMid = mid
        while l <= r {
            mid = ((r - l) / 2) + l
            var count = 0
            for pile in piles {
                count += (pile / mid)
                if (pile % mid) != 0 {
                    count += 1
                }

                if count > h { break }
            }
            
            if count > h {
                l = mid + 1
            } else {
                previousMid = mid
                r = mid - 1
            }
        }
        
        return previousMid
    }
}

class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var erased = 0
        
        var intervals = intervals.sorted {
            $0[0] < $1[0]
        }
        
        var previous = [Int]()
        for interval in intervals {
            if previous.isEmpty {
                previous = interval
                continue
            }
            
            if interval[0] < previous[1] {
                previous[1] = min(previous[1], interval[1])
                erased += 1
            } else {
                previous = interval
            }
        }
        
        return erased
    }
}

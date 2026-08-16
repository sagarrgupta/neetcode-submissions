class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var erased = 0
        
        var intervals = intervals.sorted {
            $0[1] < $1[1]
        }
        
        var previous = [Int]()
        for interval in intervals {
            if previous.isEmpty {
                previous = interval
                continue
            }
            
            if interval[0] < previous[1] {
                erased += 1
            } else {
                previous = interval
            }
        }
        
        return erased
    }
}

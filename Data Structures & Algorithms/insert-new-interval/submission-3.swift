// 3:15
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var intervals = intervals
        var potentialInsertAt = 0
        for (index, interval) in intervals.enumerated() {
            
            if interval[1] < newInterval[0] {
                potentialInsertAt = index + 1 // after
            } else if interval[0] > newInterval[1] {
                potentialInsertAt = index // before
                break
            } else {
                intervals[index][0] = min(interval[0], newInterval[0])
                var potentialMax = max(interval[1], newInterval[1])
                
                var nextIntervalIndex = index + 1
                while nextIntervalIndex < intervals.count {
                    let nextInterval = intervals[nextIntervalIndex]
                    if nextInterval[0] > potentialMax {
                        break
                    } else {
                        potentialMax = max(potentialMax, nextInterval[1])
                        intervals.remove(at: nextIntervalIndex)
                    }
                }
                intervals[index][1] = potentialMax
                return intervals
            }
        }
        
        intervals.insert(newInterval, at: potentialInsertAt)
        return intervals
    }
}

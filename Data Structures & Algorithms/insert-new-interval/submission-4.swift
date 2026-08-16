// 3:15
class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var newInterval = newInterval
        var index = 0
        
        while index < intervals.count,
        intervals[index][1] < newInterval[0] {
            res.append(intervals[index])
            index += 1
        }
        
        while index < intervals.count,
            intervals[index][0] <= newInterval[1] {
            newInterval[0] = min(newInterval[0], intervals[index][0])
            newInterval[1] = max(newInterval[1], intervals[index][1])
            index += 1
        }
        
        res.append(newInterval)
        
        while index < intervals.count {
            res.append(intervals[index])
            index += 1
        }
        
        return res
    }
}

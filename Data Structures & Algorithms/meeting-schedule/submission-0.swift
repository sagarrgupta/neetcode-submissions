/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        let sorted = intervals.sorted { $0.start < $1.start }
        
        var last = 0
        for sort in sorted {
            if last > sort.start {
                return false
            }
            last = sort.end
        }
        
        return true
    }
}

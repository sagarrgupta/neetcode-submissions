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
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        let intervalsStart = intervals.map {
            $0.start
        }.sorted()
        
        let intervalsEnd = intervals.map {
            $0.end
        }.sorted()
        
        var room = 0
        
        var startIndex = 0
        var endIndex = 0
        
        while startIndex < intervalsStart.count {
            if intervalsStart[startIndex] >= intervalsEnd[endIndex] {
                startIndex += 1
                endIndex += 1
            } else {
                room += 1
                startIndex += 1
            }
        }
        
        return room
    }
}

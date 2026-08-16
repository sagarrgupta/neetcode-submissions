class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard !intervals.isEmpty else { return [[]] }
        var intervals = intervals.sorted {
            $0[0] < $1[0]
        }
        
        var res = [[Int]]()
        var index = 1
        var currentlyProcessing = intervals[0]
        while index < intervals.count {
            let interval = intervals[index]
            if interval[0] <= currentlyProcessing[1] {
                currentlyProcessing[1] = max(interval[1], currentlyProcessing[1])
            } else {
                res.append(currentlyProcessing)
                currentlyProcessing = interval
            }
            index += 1
        }
        res.append(currentlyProcessing)
        
        return res
    } 
}

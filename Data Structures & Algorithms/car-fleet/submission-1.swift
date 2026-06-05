class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var carSets = zip(position, speed).sorted { $0.0 > $1.0 }
        var fleets = 0
        var slowestTimeAhead: Double = 0
        
        for carSet in carSets {
            let time = Double(target - carSet.0) / Double(carSet.1)
            if time > slowestTimeAhead {
                fleets += 1
                slowestTimeAhead = time
            }
        }
        
        return fleets
    }
}

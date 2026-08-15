// 4:28
class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var tank = 0
        
        var stationToConsider = Set(0..<gas.count)
        
        while !stationToConsider.isEmpty {
            let currentStationConsideration = stationToConsider.removeFirst()
            
            tank = 0
            var currentStation = currentStationConsideration
            var nextStationToGo = currentStation + 1 == gas.count ? 0 : currentStation + 1
            
            while true {
                stationToConsider.remove(currentStation)
                let key = [currentStation, tank]
                tank += gas[currentStation]
                tank = tank - cost[currentStation]
                
                if tank < 0 {
                    break
                }
                
                currentStation = nextStationToGo
                nextStationToGo = nextStationToGo + 1 == gas.count ? 0 : nextStationToGo + 1
                
                if currentStation == currentStationConsideration {
                    return currentStationConsideration
                }
            }
        }
        
        return -1
    }
}

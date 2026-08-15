class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var tank = 0
        var start = 0
        
        if gas.reduce(0, +) < cost.reduce(0, +) {
            return -1
        }
        
        while start < gas.count {
            let tempStart = start
            var currentStation = start
            
            while currentStation < gas.count {
                tank += gas[currentStation] - cost[currentStation]
                
                if tank < 0 {
                    start = currentStation + 1
                    tank = 0
                    break
                }
                
                currentStation = currentStation + 1
                
                if currentStation == gas.count {
                    return start
                }
            }
            
            if tempStart == start { break }
        }
        
        return -1
    }
}

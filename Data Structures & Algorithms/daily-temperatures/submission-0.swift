class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var results = Array(repeating: 0, count: temperatures.count)
        var stack: [(Int, Int)] = []
        stack.reserveCapacity(temperatures.count)
        
        var previous: Int?
        for (index, temp) in temperatures.enumerated() {
            if previous != nil {
                while previous != nil &&
                        (previous ?? 0) < temp &&
                        !stack.isEmpty {
                    let last = stack.removeLast()
                    results[last.0] = index - last.0
                    previous = stack.last?.1
                }
            }
            
            stack.append((index, temp))
            previous = stack.last?.1
        }
        return results
    }
}

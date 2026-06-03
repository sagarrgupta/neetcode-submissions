class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var results = Array(repeating: 0, count: temperatures.count)
        var stack: [(Int, Int)] = []
        stack.reserveCapacity(temperatures.count)
        
        for (index, temp) in temperatures.enumerated() {
            while !stack.isEmpty && (stack.last?.1 ?? 0) < temp {
                let last = stack.removeLast()
                results[last.0] = index - last.0
            }
            stack.append((index, temp))
        }
        return results
    }
}

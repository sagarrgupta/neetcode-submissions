class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        if gas.reduce(0, +) < cost.reduce(0, +) {
            return -1
        }

        var total = 0
        var res = 0
        for i in 0..<gas.count {
            total += (gas[i] - cost[i])

            if total < 0 {
                total = 0
                res = i + 1
            }
        }

        return res
    }
}
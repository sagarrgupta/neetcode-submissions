class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        guard cost.count > 1 else { return cost.last ?? 0 }
        var memo = Array(repeating: -1, count: cost.count)
        var cost = cost
        return min(checkForFutureValues(index: 0, cost: &cost, memo: &memo),
                checkForFutureValues(index: 1, cost: &cost, memo: &memo))
    }

    func checkForFutureValues(index: Int, cost: inout [Int], memo: inout [Int]) -> Int {
        guard index < cost.count else { return 0 }
        if memo[index] != -1 { return memo[index] }
        let currentValue = cost[index] + min(checkForFutureValues(index: index + 1, cost: &cost, memo: &memo),
                                            checkForFutureValues(index: index + 2, cost: &cost, memo: &memo))
        memo[index] = currentValue
        return currentValue
    }
}

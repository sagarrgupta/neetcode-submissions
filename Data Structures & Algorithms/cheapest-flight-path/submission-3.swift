class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var graph = Array(repeating: [[Int]](), count: n) // 0 = from, 1 = to, 2 = price
        
        for flight in flights {
            let from = flight[0]
            let to = flight[1]
            let price = flight[2]
            graph[from].append([to, price])
        }
        var memo = [[Int]: Int]()
        
        func dfs(from: Int, hopsRemaining: Int) -> Int {
            if let cost = memo[[from, hopsRemaining]] {
                return cost
            }
            
            var minCost = -1
            
            for neighbour in graph[from] {
                if neighbour[0] == dst {
                    minCost = (minCost == -1) ? neighbour[1] : min(minCost, neighbour[1])
                    continue
                }
                
                if hopsRemaining > 0 {
                    var cost = dfs(from: neighbour[0], hopsRemaining: hopsRemaining - 1)
                    if cost != -1 {
                        cost += neighbour[1]
                        minCost = (minCost == -1) ? cost : min(minCost, cost)
                    }
                }
            }
            
            memo[[from, hopsRemaining]] = minCost
            return minCost
        }
        
        return dfs(from: src, hopsRemaining: k)
    }
}

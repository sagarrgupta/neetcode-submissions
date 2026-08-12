class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var prices = Array(repeating: Int.max, count: n)
        prices[src] = 0
        
        for stop in 0...k {
            var tempPrices = prices
            
            for flight in flights {
                let source = flight[0]
                let destination = flight[1]
                let price = flight[2]
                
                if prices[source] == Int.max {
                    continue
                }
                
                if prices[source] + price < tempPrices[destination] {
                    tempPrices[destination] = prices[source] + price
                }
            }
            
            prices = tempPrices
        }
        
        return prices[dst] == Int.max ? -1 : prices[dst]
    }
}

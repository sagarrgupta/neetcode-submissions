class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard edges.count == n - 1 else { return false }
        
        var graph = Array(repeating: [Int](), count: n)
        var visited = Set<Int>()
        
        for edge in edges {
            guard edge.count > 1 else { continue }
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        func dfs(toVisit: Int, parent: Int) -> Bool {
            guard !visited.contains(toVisit) else { return false }
            visited.insert(toVisit)
            
            for neighbour in graph[toVisit] {
                if neighbour == parent {
                    continue
                }
                
                if !dfs(toVisit: neighbour, parent: toVisit) {
                    return false
                }
            }
            
            return true
        }
        
        if !dfs(toVisit: 0, parent: -1) {
            return false
        }
        
        return visited.count == n
    }
}

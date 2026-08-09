class Solution {
func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n)
    
    for edge in edges {
        guard edge.count > 1 else { continue }
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    
    var visited = Set<Int>()
    
    func dfs(nodeToVisit: Int, cameFrom: Int) {
        visited.insert(nodeToVisit)
        
        for node in graph[nodeToVisit] {
            if node == cameFrom {
                continue
            }
            
            if !visited.contains(node) {
                dfs(nodeToVisit: node, cameFrom: nodeToVisit)
            }
        }
    }
    
    var graphCount = 0
    
    for node in graph.indices {
        if !visited.contains(node) {
            graphCount += 1
            dfs(nodeToVisit: node, cameFrom: -1)
        }
    }
    
    return graphCount
}
}

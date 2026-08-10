class Solution {
func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var graph = Array(repeating: [Int](), count: edges.count + 1)
    var hashMap = [[Int]: Int]()
    for (index, edge) in edges.enumerated() {
        guard edge.count > 1 else { continue }
        hashMap[edge] = index
        graph[edge[0]].append(edge[1])
        graph[edge[1]].append(edge[0])
    }
    var visited = Set<Int>()
    var cycleNodes = Set<Int>()
    var foundCycle = false
    
    func dfs(nodeToVisit: Int, cameFrom: Int) -> Bool {
        visited.insert(nodeToVisit)
        let neighbors = graph[nodeToVisit]
        for node in neighbors {
            if node == cameFrom {
                continue
            }
            
            if visited.contains(node) {
                foundCycle = true
                cycleNodes.insert(node)
                break
            } else {
                if dfs(nodeToVisit: node, cameFrom: nodeToVisit) {
                    if cycleNodes.contains(node) {
                        foundCycle = false
                    } else {
                        cycleNodes.insert(node)
                    }
                    break
                }
            }
        }
        return foundCycle
    }
    dfs(nodeToVisit: 1, cameFrom: -1)
    
    for i in stride(from: edges.count - 1, through: 0, by: -1) {
        let edge = edges[i]
        if cycleNodes.contains(edge[0]) && cycleNodes.contains(edge[1]) {
            return edge
        }
    }
    
    return []
}
}

class Solution {
    var parentOf = [Int]()
    
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        parentOf = Array(0...edges.count)
        
        for edge in edges {
            guard edge.count > 1 else { continue }
            if !union(edge[0], v: edge[1]) {
                return edge
            }
        }
        return []
    }
    
    func union(_ u: Int, v: Int) -> Bool {
        let rootU = find(u)
        let rootV = find(v)
        
        guard rootU != rootV else { return false }
        if rootU <= rootV {
            parentOf[rootV] = rootU
        } else {
            parentOf[rootU] = rootV
        }
        return true
    }
    
    func find(_ node: Int) -> Int {
        if parentOf[node] != node {
            parentOf[node] = find(parentOf[node])
        }
        return parentOf[node]
    }
}
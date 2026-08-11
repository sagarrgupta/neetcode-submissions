// 3:34
class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        guard !points.isEmpty else { return 0 }
        
        var distance = [[Int]: Int]()
        for point in points {
            distance[point] = Int.max
        }
        
        var processedNodes = Set<[Int]>()
        var currentNode = points[0]
        distance[currentNode] = 0
        var nextNodeToCheck: [Int]?
        
        while processedNodes.count != points.count {
            var minDistanceSeen = Int.max
            processedNodes.insert(currentNode)
            
            for node in points {
                if processedNodes.contains(node) {
                    continue
                }
                
                let currentDistance = abs(currentNode[0] - node[0]) + abs(currentNode[1] - node[1])
                distance[node] = min(currentDistance, distance[node] ?? currentDistance)
                
                if distance[node] ?? currentDistance < minDistanceSeen {
                    minDistanceSeen = distance[node] ?? currentDistance
                    nextNodeToCheck = node
                }
            }
            
            if let nextNode = nextNodeToCheck {
                currentNode = nextNode
                nextNodeToCheck = nil
            } else {
                break
            }
        }
        var totalSum = 0
        distance.values.forEach {
            totalSum += $0
        }
        
        return totalSum
    }
}

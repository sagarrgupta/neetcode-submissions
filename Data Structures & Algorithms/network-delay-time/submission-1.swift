class Solution {
    class GraphNode: Hashable {
        static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
            lhs === rhs
        }
        
        var currentValue: Int = Int.max
        var edges = [Edge]()
        
        init(currentValue: Int = Int.max, edges: [Edge] = [Edge]()) {
            self.currentValue = currentValue
            self.edges = edges
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
    }

    class Edge {
        var destination: GraphNode
        var weight = 0
        
        init(destination: GraphNode, weight: Int = 0) {
            self.destination = destination
            self.weight = weight
        }
    }

    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var graph = [GraphNode]()
        
        for i in 0...n {
            graph.append(GraphNode())
        }
        
        for time in times {
            let indexToUse = time[0]
            graph[indexToUse].edges.append(Edge(destination: graph[time[1]], weight: time[2]))
        }
        
        var processedNodes = Set<GraphNode>()
        var unprocessedNodes = Set<GraphNode>()
        var totalTime = 0
        
        func dijkstra(_ currentNode: GraphNode) {
            guard !processedNodes.contains(currentNode) else { return }
            processedNodes.insert(currentNode)
            totalTime = currentNode.currentValue
            
            for edge in currentNode.edges {
                let newValue = currentNode.currentValue + edge.weight
                guard newValue < edge.destination.currentValue else { continue }
                edge.destination.currentValue = newValue
                unprocessedNodes.insert(edge.destination)
            }
            
            
            var nextNodeToExplore: GraphNode?
            
            for node in unprocessedNodes {
                if node.currentValue < nextNodeToExplore?.currentValue ?? Int.max {
                    nextNodeToExplore = node
                }
            }
            
            if let nextNodeToExplore = nextNodeToExplore {
                unprocessedNodes.remove(nextNodeToExplore)
                dijkstra(nextNodeToExplore)
            }
        }
        
        graph[k].currentValue = 0
        dijkstra(graph[k])
        
        return processedNodes.count == n ? totalTime : -1
    }
}

/*
Definition for a Node.
class Node {
    var val: Int
    var neighbors: [Node?]
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
*/

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var hashmap = [ObjectIdentifier: Node]()
        
        func dfs(_ node: Node?) -> Node? {
            guard let node = node else { return nil }
            let nodeId = ObjectIdentifier(node)
            
            if let cloneNode = hashmap[nodeId] {
                return cloneNode
            }
            
            let newNode = Node(node.val)
            hashmap[nodeId] = newNode
            
            for neighbor in node.neighbors {
                if let cloneNeighbor = dfs(neighbor) {
                    newNode.neighbors.append(cloneNeighbor)
                }
            }
            
            return newNode
        }
        
        return dfs(node)
    }
}

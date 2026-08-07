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
    // 4:17
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        let newNode = Node(node.val)
        var oldNodeQueue = [node]
        
        var hashmap = [ObjectIdentifier: Node]()
        hashmap[ObjectIdentifier(node)] = newNode
        
        var index = 0
        
        while index < oldNodeQueue.count {
            let currentNode = oldNodeQueue[index]
            
            for neighbor in currentNode.neighbors {
                guard let neighbor = neighbor else { continue }
                
                if hashmap[ObjectIdentifier(neighbor)] == nil {
                    hashmap[ObjectIdentifier(neighbor)] = Node(neighbor.val)
                    oldNodeQueue.append(neighbor)
                }
                hashmap[ObjectIdentifier(currentNode)]?.neighbors.append(hashmap[ObjectIdentifier(neighbor)])
            }
            
            index += 1
        }
        
        return newNode
    }
}

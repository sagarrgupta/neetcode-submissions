/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var nodes: [ObjectIdentifier : Node] = [:]
        var current = head
        while let node = current {
            nodes[ObjectIdentifier(node)] = Node(node.val)
            current = node.next
        }
        
        current = head
        while let node = current {
            if let next = node.next  {
                current = node.next
                nodes[ObjectIdentifier(node)]?.next = nodes[ObjectIdentifier(next)]
            }
            
            if let random = node.random {
                current = node.next
                nodes[ObjectIdentifier(node)]?.random = nodes[ObjectIdentifier(random)]
            }
            current = node.next
        }

        return head == nil ? nil : nodes[ObjectIdentifier(head!)]
    }
}
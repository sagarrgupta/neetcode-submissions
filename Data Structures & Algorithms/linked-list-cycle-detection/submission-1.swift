/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var visitedNodes: Set<ObjectIdentifier> = Set()
        var currentNode = head
        var index = 0
        while currentNode != nil {
            let id = ObjectIdentifier(currentNode ?? ListNode(0))
            guard let val = currentNode?.val else {
                currentNode = currentNode?.next
                continue
            }
            if visitedNodes.contains(id) {
                return true
            } else {
                visitedNodes.insert(id)
            }
            index += 1
            currentNode = currentNode?.next
        }
        return false
    }
}

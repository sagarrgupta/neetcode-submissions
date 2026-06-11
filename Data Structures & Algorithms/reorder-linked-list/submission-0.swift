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
    func reorderList(_ head: ListNode?) {
        var stack = [ListNode]()
        var current = head
        while current != nil {
            guard let head = current else { break }
            stack.append(head)
            current = head.next
        }
        
        var half = (stack.count / 2)
        if stack.count % 2 == 0 {
            half -= 1
            stack.removeSubrange(Range(0...half))
        } else {
            stack.removeSubrange(Range(0...half))
        }
        
        current = head
        var isUpdated = false
        while !stack.isEmpty {
            let nextToAdd = current?.next
            let toRemove = stack.removeLast()
            toRemove.next = nextToAdd
            current?.next = toRemove
            current = nextToAdd
            if !isUpdated {
                head?.next = toRemove
                isUpdated = true
            }
        }
        current?.next = nil
    }
}

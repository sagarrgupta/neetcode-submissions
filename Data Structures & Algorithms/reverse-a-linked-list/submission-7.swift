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
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
        
        var reversedList = head
        var current = head?.next
        while current != nil {
            let next = current?.next
            current?.next = reversedList
            reversedList = current
            current = next
        }
        head?.next = nil
        
        return reversedList
    }
}

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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummy = ListNode(-1)
        var tail: ListNode? = dummy
        var left = list1
        var right = list2
        
        while left != nil && right != nil {
            if left!.val <= right!.val {
                tail?.next = left
                left = left?.next
            } else {
                tail?.next = right
                right = right?.next
            }
            tail = tail?.next
        }
        
        tail?.next = left ?? right
        
        return dummy.next
    }
}

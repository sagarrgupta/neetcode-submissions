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
        if list1 == nil { return list2 }
        if list2 == nil { return list1 }
        
        var combined: ListNode?
        var tail: ListNode?
        var left = list1
        var right = list2
        
        while left != nil || right != nil {
            if left == nil {
                tail?.next = right
                tail = right
                right = right?.next
            }
            
            if right == nil {
                tail?.next = left
                tail = left
                left = left?.next
            }
            
            guard let rightVal = right?.val, let leftVal = left?.val else { continue }
            if leftVal <= rightVal {
                if combined == nil {
                    combined = left
                    tail = combined
                    left = left?.next
                } else {
                    tail?.next = left
                    tail = left
                    left = left?.next
                }
            } else {
                if combined == nil {
                    combined = right
                    tail = combined
                    right = right?.next
                } else {
                    tail?.next = right
                    tail = right
                    right = right?.next
                }
            }
        }
        tail?.next = nil
        
        return combined
    }
}

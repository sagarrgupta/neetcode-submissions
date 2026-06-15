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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var number1 = 0
        var number2 = 0
        var toAddCarry = false
        var list1 = l1
        var list2 = l2
        var head: ListNode?
        var current: ListNode?
        
        while list1 != nil || list2 != nil || toAddCarry {
            number1 = 0
            number2 = 0
            if let value = list1?.val {
                number1 = value
            }
            if let value = list2?.val {
                number2 = value
            }
            
            var sum = number1 + number2
            if toAddCarry {
                sum += 1
            }
            let valueToAdd = sum % 10
            toAddCarry = sum > 9 ? true : false
            
            let newNode = ListNode(valueToAdd)
            current == nil ? (current = newNode) : (current?.next = newNode)
            current = newNode
            if head == nil { head = current }
            
            list1 = list1?.next
            list2 = list2?.next
        }
        
        return head
    }
}

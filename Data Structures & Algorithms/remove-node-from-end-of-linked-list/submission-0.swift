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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        func removeNth(previous: ListNode?, current: ListNode?, _ n: Int) -> (ListNode?, Int) {
            guard current != nil else { return (nil, n - 1) }
            let num = removeNth(previous: current, current: current?.next, n)
            if num.1 == 0 {
                if previous == nil {
                    return (current?.next, 1)
                } else {
                    previous?.next = current?.next
                    return (nil, num.1 - 1)
                }
            } else {
                return (current, num.1 - 1)
            }
        }
        return removeNth(previous: nil, current: head, n).0
    }
}

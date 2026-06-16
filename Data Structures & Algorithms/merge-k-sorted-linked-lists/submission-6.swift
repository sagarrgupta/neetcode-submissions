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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return divideAndMerge(lists: lists, left: 0, right: lists.count - 1)
    }

    func divideAndMerge(lists: [ListNode?], left: Int, right: Int) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        guard left != right else { return lists[left] }
        
        let mid = ((right - left) / 2) + left
        var leftSorted = divideAndMerge(lists: lists, left: left, right: mid) // lists[left..<mid]
        var rightSorted = divideAndMerge(lists: lists, left: mid + 1, right: right) // lists[mid...right]
        
        var toReturn = ListNode(0)
        let head = toReturn
        while leftSorted != nil || rightSorted != nil {
            if let leftValue = leftSorted?.val {
                if let rightValue = rightSorted?.val {
                    if leftValue <= rightValue {
                        let newNode = ListNode(leftValue)
                        toReturn.next = newNode
                        toReturn = newNode
                        leftSorted = leftSorted?.next
                    } else {
                        let newNode = ListNode(rightValue)
                        toReturn.next = newNode
                        toReturn = newNode
                        rightSorted = rightSorted?.next
                    }
                } else {
                    toReturn.next = leftSorted
                    break
                }
            } else {
                toReturn.next = rightSorted
                break
            }
        }
        
        return head.next
    }
}

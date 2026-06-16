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
        return mergeLists(index: 0, lists: lists)
    }

    func mergeLists(index: Int, lists: [ListNode?]) -> ListNode? {
        guard index < lists.count else { return nil }
        
        var current = lists[index]
        var next = mergeLists(index: index + 1, lists: lists)
        
        var newList = ListNode(0)
        var currentNode = newList
        
        while current != nil || next != nil {
            if let currentValue = current?.val {
                if let nextValue = next?.val {
                    if currentValue <= nextValue {
                        let newNode = ListNode(currentValue)
                        currentNode.next = newNode
                        currentNode = newNode
                        current = current?.next
                    } else {
                        let newNode = ListNode(nextValue)
                        currentNode.next = newNode
                        currentNode = newNode
                        next = next?.next
                    }
                } else {
                    currentNode.next = current
                    break
                }
            } else if let nextValue = next?.val {
                currentNode.next = next
                break
            }
        }
        
        return newList.next
    }
}

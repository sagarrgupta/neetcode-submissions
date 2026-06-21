/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return (isGoodNode(current: root, currentMax: root.val))
    }

    func isGoodNode(current: TreeNode?, currentMax: Int) -> Int {
        guard let current = current else { return 0 }
        var valueToReturn = 0
        if current.val >= currentMax {
            valueToReturn += 1
        }
        let max = max(currentMax, current.val)
        valueToReturn += isGoodNode(current: current.left, currentMax: max)
        valueToReturn += isGoodNode(current: current.right, currentMax: max)
        return valueToReturn
    }
}

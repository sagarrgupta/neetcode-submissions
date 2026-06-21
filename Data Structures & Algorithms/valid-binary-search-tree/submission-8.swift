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
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return isValid(root, minBreakVal: Int.min, maxBreakVal: Int.max)
    }

    func isValid(_ root: TreeNode?, minBreakVal: Int, maxBreakVal: Int) -> Bool {
        guard let root = root else { return true }
        
        if root.val > minBreakVal && root.val < maxBreakVal {
            return isValid(root.left, minBreakVal: minBreakVal, maxBreakVal: root.val) &&
            isValid(root.right, minBreakVal: root.val, maxBreakVal: maxBreakVal)
        } else {
            return false
        }
    }
}

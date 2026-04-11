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
    func isBalanced(_ root: TreeNode?) -> Bool {
        return getHeight(root) != -1
    }

    func getHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = getHeight(root.left)
        let right = getHeight(root.right)
        
        if left == -1 || right == -1 {
            return -1
        }
        
        var diff = 0
        if left > right {
            diff = left - right
        } else {
            diff = right - left
        }
        if diff > 1 {
            return -1
        }
        return 1 + max(left, right)
    }
}

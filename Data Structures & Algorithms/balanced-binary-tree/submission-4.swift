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
        guard let root = root else { return true }
        
        let height = getHeight(root)
        
        if height == -1 {
            return false
        }
        
        return true
    }

    func getHeight(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let left = getHeight(root.left)
        let right = getHeight(root.right)
        
        if left == -1 || right == -1 {
            return -1
        }
        
        if abs(left - right) > 1 {
            return -1
        }
        return 1 + max(left, right)
    }
}

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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else { return root }
        
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        _ = invertTree(root?.left)
        _ = invertTree(root?.right)
        
        return root
    }
}

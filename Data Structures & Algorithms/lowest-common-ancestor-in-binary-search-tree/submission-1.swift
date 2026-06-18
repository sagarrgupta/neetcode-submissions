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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard root != nil else { return nil }
        
        if root?.val == p?.val || root?.val == q?.val {
            return root
        }
        
        if (p?.val ?? 0) < (root?.val ?? 0) && (q?.val ?? 0) < (root?.val ?? 0) {
            return lowestCommonAncestor(root?.left, p, q)
        } else if (p?.val ?? 0) > (root?.val ?? 0) && (q?.val ?? 0) > (root?.val ?? 0) {
            return lowestCommonAncestor(root?.right, p, q)
        } else {
            return root
        }
    }
}

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
    var result = 0

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        height(root)
        return result
    }

    func height(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let left = height(root.left)
        let right = height(root.right)
        result = max(result, left + right)
        return 1 + max(left, right)
    }
}

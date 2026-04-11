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
        
        if root?.left != nil || root?.right != nil {
            invertChild(root)
        }
        invertTree(root?.left)
        invertTree(root?.right)
        
        return root
    }

    func invertChild(_ root: TreeNode?) -> TreeNode? {
        let left = root?.left ?? nil
        root?.left = root?.right ?? nil
        root?.right = left ?? nil

        print(root?.left?.val)
        print(root?.right?.val)
        return root
    }
}

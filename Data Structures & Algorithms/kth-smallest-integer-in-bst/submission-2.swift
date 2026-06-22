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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var values = [Int]()
        
        func getValue(_ root: TreeNode?) {
            guard let root = root, values.count < k else { return }
            getValue(root.left)
            values.append(root.val)
            getValue(root.right)
        }
        
        getValue(root)
        return values[k-1]
    }
}

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
        getValue(root, values: &values)
        return values[k-1]
    }

    func getValue(_ root: TreeNode?, values: inout [Int]) {
        guard let root = root else { return }
        getValue(root.left, values: &values)
        values.append(root.val)
        getValue(root.right, values: &values)
    }
}

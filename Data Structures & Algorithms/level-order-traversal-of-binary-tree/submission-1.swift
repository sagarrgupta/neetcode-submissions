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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var levels = [[Int]]()
        fillOrder(root: root, toFillIn: &levels, level: 1)
        return levels
    }

    func fillOrder(root: TreeNode?, toFillIn: inout [[Int]], level: Int) {
        guard let root = root else { return }
        
        if toFillIn.count < level {
            toFillIn.append([])
        }
        toFillIn[level - 1].append(root.val)
        fillOrder(root: root.left, toFillIn: &toFillIn, level: level + 1)
        fillOrder(root: root.right, toFillIn: &toFillIn, level: level + 1)
    }
}

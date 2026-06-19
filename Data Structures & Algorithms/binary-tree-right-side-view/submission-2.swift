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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var values = [Int]()
        
        func dfs(root: TreeNode?, level: Int) {
            guard let root = root else { return }
            if values.count == level {
                values.append(root.val)
            }
            
            dfs(root: root.right, level: level + 1)
            dfs(root: root.left, level: level + 1)
        }
        dfs(root: root, level: 0)
        return values
    }
}

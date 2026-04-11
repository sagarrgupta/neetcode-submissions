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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        var stack = [root]
        
        while !stack.isEmpty {
            let current = stack.removeFirst()
            if current?.val == subRoot?.val {
                if checkSubtree(current, subRoot) {
                    return true
                }
            }
            if current != nil {
                stack.append(current?.left)
                stack.append(current?.right)
            }
        }
        
        return false
    }

    func checkSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        var s1 = [root]
        var s2 = [subRoot]
        
        while !(s1.isEmpty || s2.isEmpty) {
            let left = s1.removeFirst()
            let right = s2.removeFirst()
            
            if left == nil && right == nil {
                continue
            }
            
            if left == nil || right == nil || left?.val != right?.val {
                return false
            }
            
            s1.append(left?.left)
            s1.append(left?.right)
            
            s2.append(right?.left)
            s2.append(right?.right)
        }
        
        return true
    }
}

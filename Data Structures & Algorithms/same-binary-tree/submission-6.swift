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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var leftStack = [TreeNode?]()
        leftStack.append(p)
        
        var rightStack = [TreeNode?]()
        rightStack.append(q)
        
        while (!leftStack.isEmpty || !rightStack.isEmpty) {
            let c1 = leftStack.removeFirst()
            let c2 = rightStack.removeFirst()
            
            if (c1?.val != c2?.val) {
                return false
            }
            
            if c1 != nil {
                leftStack.append(c1?.left)
                leftStack.append(c1?.right)
            }
            
            if c2 != nil {
                rightStack.append(c2?.left)
                rightStack.append(c2?.right)
            }
        }
        
        return true
    }
}

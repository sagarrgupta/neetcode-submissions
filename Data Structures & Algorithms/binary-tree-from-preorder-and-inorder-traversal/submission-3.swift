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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty else { return nil }
        
        let root = TreeNode(preorder[0])
        guard let mid = inorder.firstIndex(of: root.val) else { return nil }
        
        let leftPreOrder = Array(preorder[1..<(mid + 1)])
        let leftInOrder = Array(inorder[0..<mid])
        
        let rightPreOrder = Array(preorder[(mid + 1)..<preorder.count])
        let rightInOrder = Array(inorder[(mid + 1)..<inorder.count])
        
        root.left = buildTree(leftPreOrder, leftInOrder)
        root.right = buildTree(rightPreOrder, rightInOrder)
        
        return root
    }
}

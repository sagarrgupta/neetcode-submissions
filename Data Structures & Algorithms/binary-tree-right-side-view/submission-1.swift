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
        var currentList: [TreeNode] = [root]
        var values = [root.val]
        
        while !currentList.isEmpty {
            let currentCount = currentList.count
            
            for _ in 0..<currentCount {
                let node = currentList.removeFirst()
                if let left = node.left {
                    currentList.append(left)
                }
                if let right = node.right {
                    currentList.append(right)
                }
            }
            if !currentList.isEmpty {
                values.append(currentList.last!.val)
            }
        }
        
        return values
    }
}

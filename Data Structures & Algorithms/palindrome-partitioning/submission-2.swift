class Solution {
    func partition(_ s: String) -> [[String]] {
        var chars = Array(s)
        var toReturn = [[String]]()
        var currentList = [String]()
        
        func backtrack(left: Int) {
            if left == chars.count {
                toReturn.append(currentList)
                return
            }

            for right in left..<chars.count {
                let substring = Array(chars[left...right])

                if !checkIfPalindrome(substring) {
                    continue
                }

                currentList.append(String(substring))
                backtrack(left: right + 1)
                currentList.removeLast()
            }
        }
        
        backtrack(left: 0)
        
        return toReturn
    }

    func checkIfPalindrome(_ s: [Character]) -> Bool {
        guard !s.isEmpty else { return true }
        
        var left = 0
        var right = (s.count - 1)
        
        while left < right {
            if s[left] != s[right] {
                return false
            }
            
            left += 1
            right -= 1
        }
        
        return true
    }
}

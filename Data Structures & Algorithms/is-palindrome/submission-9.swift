class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let myArray = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
        var front = 0
        var back = myArray.count - 1
        
        while front < back {
            if myArray[front] != myArray[back] { return false }
            front += 1
            back -= 1
        }
        return true
    }
}

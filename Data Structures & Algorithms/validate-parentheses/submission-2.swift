class Solution {
    func isValid(_ s: String) -> Bool {
        var openBrackets: [Character] = ["[", "{", "("]
        var closeBrackets: [Character]  = ["]", "}", ")"]
        var currentStack = [Int]()
        
        for character in s {
            if currentStack.isEmpty && closeBrackets.contains(character) {
                return false
            }
            
            if openBrackets.contains(character) {
                if let index = openBrackets.firstIndex(of: character) {
                    currentStack.append(index)
                }
            }
            
            if closeBrackets.contains(character) {
                if let index = closeBrackets.firstIndex(of: character) {
                    if currentStack.last == index {
                        currentStack.removeLast()
                    } else {
                        return false
                    }
                }
            }
        }
        return currentStack.isEmpty
    }
}

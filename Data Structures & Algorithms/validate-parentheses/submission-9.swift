class Solution {
    func isValid(_ s: String) -> Bool {
        var currentStack = [Character]()
        
        for char in s {
            switch char {
            case "(":
                currentStack.append(")")
                
            case "{":
                currentStack.append("}")
                
            case "[":
                currentStack.append("]")
                
            case ")", "}", "]":
                if currentStack.isEmpty || char != currentStack.popLast() { return false }
                
            default:
                break
            }
        }
        return currentStack.isEmpty
    }
}

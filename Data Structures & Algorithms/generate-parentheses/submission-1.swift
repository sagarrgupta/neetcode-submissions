class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var results = [String]()
        
        guard n > 0 else { return results }
        
        var open = n
        var close = n
        var currentString = ""
        
        func backtrack() {
            guard currentString.count < (2 * n) else {
                results.append(currentString)
                return
            }
            
            if open > 0 {
                currentString.append("(")
                open -= 1
                
                backtrack()
                
                currentString.removeLast()
                open += 1
            }
            
            if close > open {
                currentString.append(")")
                close -= 1
                
                backtrack()
                
                currentString.removeLast()
                close += 1
            }
        }
        
        backtrack()
        
        return results
    }
}

class Solution {
    func checkValidString(_ s: String) -> Bool {
        var openStack = [Int]()
        var starStack = [Int]()
        
        for (index, char) in s.enumerated() {
            switch char {
            case "(":
                openStack.append(index)
                
            case ")":
                if openStack.popLast() == nil {
                    if starStack.popLast() == nil {
                        return false
                    }
                }
                
            case "*":
                starStack.append(index)
                
            default:
                break
            }
        }
        
        while !openStack.isEmpty {
            guard let openIndex = openStack.popLast(),
                let starIndex = starStack.popLast() else {
                return false
            }
            
            if starIndex < openIndex {
                return false
            }
        }
        
        return true
    }
}

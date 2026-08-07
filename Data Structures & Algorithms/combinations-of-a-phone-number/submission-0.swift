class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        var digitsToLetters = ["2":["a", "b", "c"],
                            "3":["d", "e", "f"],
                            "4":["g", "h", "i"],
                            "5":["j", "k", "l"],
                            "6":["m", "n", "o"],
                            "7":["p", "q", "r", "s"],
                            "8":["t", "u", "v"],
                            "9":["w", "x", "y", "z"]]
        var results = [String]()
        var currentString = ""

        func appendChar(digits: String) {
            var digits = digits
            if digits == "" {
                if !currentString.isEmpty { results.append(currentString) }
                return
            }
            
            var characters = [String]()
            while !digits.isEmpty && characters.isEmpty {
                let digit = String(digits.remove(at: digits.startIndex))
                characters = digitsToLetters[digit] ?? []
            }
            
            for i in 0..<characters.count {
                currentString.append(characters[i])
                appendChar(digits: String(digits))
                currentString.removeLast()
            }
        }
        
        appendChar(digits: digits)
        
        return results
    }
}

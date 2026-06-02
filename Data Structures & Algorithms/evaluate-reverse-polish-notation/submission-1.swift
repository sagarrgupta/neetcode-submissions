class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        enum Operators: String {
            case plus = "+"
            case min = "-"
            case multiple = "*"
            case division = "/"
        }
        
        var current: Int? = nil
        var numbers: [Int] = []
        
        for char in tokens {
            if let number = Int(char) {
                numbers.append(number)
            } else {
                guard let secondOR = numbers.popLast(),
                        let firstOR = numbers.popLast() else { continue }
                switch Operators(rawValue: char) {
                case .plus:
                    current = firstOR + secondOR
                    
                case .min:
                    current = firstOR - secondOR
                    
                case .multiple:
                    current = firstOR * secondOR
                    
                case .division:
                    current = firstOR / secondOR
                    
                case .none:
                    break
                }
                if let result = current { numbers.append(result) }
                current = nil
            }
        }
        return numbers.popLast() ?? 0
    }
}

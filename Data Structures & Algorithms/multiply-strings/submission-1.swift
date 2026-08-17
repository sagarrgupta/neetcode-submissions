class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        var array = Array(repeating: 0, count: num1.count + num2.count)
        
        var upper = [Character]()
        var lower = [Character]()
        
        if num1.count > num2.count {
            upper = Array(num1)
            lower = Array(num2)
        } else {
            upper = Array(num2)
            lower = Array(num1)
        }
        
        for l in stride(from: lower.count - 1, through: 0, by: -1) {
            for u in stride(from: upper.count - 1, through: 0, by: -1) {
                let down = Int("\(lower[l])") ?? 1
                let up = Int("\(upper[u])") ?? 1
                
                let multiple = down * up
                
                let p1 = l + u
                let p2 = p1 + 1
                
                let sum = array[p2] + multiple
                
                array[p2] = sum % 10
                array[p1] += sum / 10
            }
        }
        
        var numberFound = false
        var res = ""
        for number in array {
            if number != 0 {
                numberFound = true
            }
            
            if numberFound {
                res.append("\(number)")
            }
        }
        return res.isEmpty ? "0" : res
    }
}

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var newDigits = digits
        for i in (0..<newDigits.count).reversed() {
            if newDigits[i] == 9 {
                newDigits[i] = 0
            } else {
                newDigits[i] = newDigits[i] + 1
                break
            }
        }
        
        if newDigits.first == 0 {
            newDigits.insert(1, at: 0)
        }

        return newDigits
    }
}

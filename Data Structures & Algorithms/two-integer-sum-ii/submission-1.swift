class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count > 1 else { return [Int]() }
        
        var front = 0
        var back = numbers.count - 1
        
        while front < back {
            let sum = numbers[front] + numbers[back]
            
            if sum == target {
                return [front+1, back+1]
            } else if sum > target {
                back -= 1
            } else {
                front += 1
            }
        }
        
        return []
    }
}

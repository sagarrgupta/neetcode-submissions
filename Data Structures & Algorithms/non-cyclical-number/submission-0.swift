class Solution {
    func isHappy(_ n: Int) -> Bool {
        var set: Set<Int> = Set()
        
        var number = getSquareSum(n)
        
        while true {
            if number == 1 {
                return true
            } else if set.contains(number) {
                return false
            } else {
                set.insert(number)
                number = getSquareSum(number)
            }
        }
    }

    func getSquareSum(_ n: Int) -> Int {
        let number = "\(n)"
        
        var sum = 0
        for num in number {
            let num = Int("\(num)") ?? 0
            sum += (num * num)
        }
        return sum
    }
}

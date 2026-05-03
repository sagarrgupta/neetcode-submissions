class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var num = n
        var count = 0
        while num != 0 {
            num = num & (num - 1)
            count += 1
        }
        
        return count
    }
}

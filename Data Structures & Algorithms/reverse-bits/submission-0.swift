class Solution {
    func reverseBits(_ n: Int) -> Int {
        var res = 0
        
        for i in 0...31 {
            if (n >> i & 1) == 1 {
                res |= (1 << (31 - i))
            }
        }
        
        return res
    }
}

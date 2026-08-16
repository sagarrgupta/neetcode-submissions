class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0 { return 0 }
        if n == 0 { return 1 }
        
        var base = x
        var exponent = n
        var result: Double = 1

        if exponent < 0 {
            base = 1 / base
        }

        while exponent != 0 {
            if exponent % 2 != 0 {
                result *= base
            }

            exponent /= 2
            base *= base
        }
        
        return result
    }
}

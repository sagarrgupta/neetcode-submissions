class Solution {
    func countSubstrings(_ s: String) -> Int {
        func manacherAlgo() -> [Int] {
            let tempS = "#" + s.map({ "\($0)#" }).joined()
            let chars = Array(tempS)
            var pCount = Array(repeating: 0, count: chars.count)
            var l = 0
            var r = 0
            
            for i in 0..<chars.count {
                if i < r {
                    pCount[i] = min(pCount[l + (r - i)], r - i)
                }
                
                while (i - pCount[i] - 1) >= 0,
                    (i + pCount[i] + 1) < chars.count,
                    chars[i - pCount[i] - 1] == chars[i + pCount[i] + 1] {
                    pCount[i] += 1
                }
                
                if (i + pCount[i]) > r {
                    l = i - pCount[i]
                    r = i + pCount[i]
                }
            }
            return pCount
        }
        
        let palidromes = manacherAlgo()
        var res = 0
        for palidrome in palidromes {
            res += (palidrome + 1) / 2
        }
        return res
    }
}

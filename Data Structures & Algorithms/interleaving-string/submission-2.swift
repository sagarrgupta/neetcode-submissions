class Solution {
 func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    return interleaveHelper(s1, s2, s3) || interleaveHelper(s2, s1, s3)
}

func interleaveHelper(_ s1: String, _ s2: String, _ s3: String) -> Bool {
    var s1Chars = Array(s1)
    var s2Chars = Array(s2)
    var s3Chars = Array(s3)

    guard s1Chars.count + s2Chars.count == s3Chars.count else { return false }
    
    var s1Index = 0
    var s2Index = 0
    
    for char in s3Chars {
        if s1Index < s2Index {
            if s1Index < s1Chars.count && s1Chars[s1Index] == char {
                s1Index += 1
            } else if s2Index < s2Chars.count && s2Chars[s2Index] == char {
                s2Index += 1
            }
        } else {
            if s2Index < s2Chars.count && s2Chars[s2Index] == char {
                s2Index += 1
            } else if s1Index < s1Chars.count && s1Chars[s1Index] == char {
                s1Index += 1
            }
        }
    }
    
    if s1Index == s1Chars.count && s2Index == s2Chars.count {
        return true
    }
        
    return false
}
}

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
    
    var count = Array(repeating: 0, count: 26)
    
    for byte in s.utf8 {
        count[Int(byte - 97)] += 1
    }
    
    for byte in t.utf8 {
        count[Int(byte - 97)] -= 1
    }
    
    for value in count {
        if value != 0 { return false }
    }
    
    return true
    }
}

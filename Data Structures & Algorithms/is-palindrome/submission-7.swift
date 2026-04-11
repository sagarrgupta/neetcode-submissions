class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let myArray = Array(s.lowercased())
        var front = 0
        var back = myArray.count - 1
        
        while front <= back {
            while front < myArray.count && !(myArray[front].isLetter || myArray[front].isNumber) { front += 1 }
            while back >= 0 && !(myArray[back].isLetter || myArray[back].isNumber) { back -= 1 }
            guard front < myArray.count && back >= 0 else { break }
            print(myArray[front], myArray[back])
            if myArray[front] != myArray[back] { return false }
            front += 1
            back -= 1
        }
        return true
    }
}

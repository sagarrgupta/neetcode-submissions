class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var newArray = [Int]()
        for num in nums {
            if newArray.contains(num) {
                return true
            }
            newArray.append(num)
        }
        return false
    }
}

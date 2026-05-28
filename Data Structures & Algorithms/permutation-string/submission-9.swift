class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s1Array = Array(s1)
        let s2Array = Array(s2)

        let m = s1Array.count
        let n = s2Array.count

        if m > n {
            return false
        }

        let sortedS1 = s1Array.sorted()

        for i in 0..<n {
            var current = [Character]()

            for j in i..<n {
                current.append(s2Array[j])

                if current.count == m {
                    if current.sorted() == sortedS1 {
                        return true
                    }
                    break
                }
            }
        }

        return false
    }
}

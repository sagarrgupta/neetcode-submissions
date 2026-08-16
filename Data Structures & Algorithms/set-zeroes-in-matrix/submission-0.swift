class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rowsFound = Set<Int>()
        var columnsFound = Set<Int>()
        
        for r in matrix.indices {
            for c in 0..<matrix[0].count {
                if matrix[r][c] == 0 {
                    rowsFound.insert(r)
                    columnsFound.insert(c)
                }
            }
        }
        
        for r in matrix.indices {
            for c in 0..<matrix[0].count {
                if rowsFound.contains(r) || columnsFound.contains(c) {
                    matrix[r][c] = 0
                }
            }
        }
    }
}

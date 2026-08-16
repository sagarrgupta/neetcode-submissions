class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for row in matrix.indices {
            for column in (row + 1)..<matrix.count {
                (matrix[row][column], matrix[column][row]) = (matrix[column][row], matrix[row][column])
            }
        }
        
        for row in matrix.indices {
            for column in 0..<matrix.count/2 {
                (matrix[row][column], matrix[row][matrix.count - 1 - column]) = (matrix[row][matrix.count - 1 - column], matrix[row][column])
            }
        }
    }
}

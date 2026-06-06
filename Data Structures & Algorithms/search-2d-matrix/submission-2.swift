class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        var columnsToSearch = (0, matrix[0].count - 1)
        
        var rowTop = 0
        var rowBottom = matrix.count - 1
        var rowMiddle = rowBottom / 2
        
        while rowTop < rowBottom {
            if target >= matrix[rowMiddle][columnsToSearch.0] && target <= matrix[rowMiddle][columnsToSearch.1] {
                break
            } else if target < matrix[rowMiddle][columnsToSearch.0] {
                rowBottom = rowMiddle - 1
            } else {
                rowTop = rowMiddle + 1
            }
            rowMiddle = ((rowBottom - rowTop) / 2) + rowTop
        }
        
        var columnMiddle = columnsToSearch.1 / 2
        while columnsToSearch.0 <= columnsToSearch.1 {
            let number = matrix[rowMiddle][columnMiddle]
            if target == number {
                return true
            } else if target < number {
                columnsToSearch = (columnsToSearch.0, columnMiddle - 1)
            } else {
                columnsToSearch = (columnMiddle + 1, columnsToSearch.1)
            }
            columnMiddle = ((columnsToSearch.1 - columnsToSearch.0) / 2) + columnsToSearch.0
        }
        
        return false
    }
}

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return [] }
        
        var direction = [(0, 1),
                                (1, 0),
                                (0, -1),
                                (-1, 0)]
        
        var currentDirection = 0
        var toOutput = [Int]()
        var currentPosition = [0, 0]
        var visited = Set<[Int]>()
        visited.insert([0, 0])
        toOutput.append(matrix[0][0])
        
        let totalElements = matrix.count * (matrix.first?.count ?? 0)
        
        while toOutput.count != totalElements {
            
            var directionToGo = direction[currentDirection]
            var nextRow = currentPosition[0] + directionToGo.0
            var nextColumn = currentPosition[1] + directionToGo.1
            
            print(nextRow, nextColumn)
            while (nextRow >= matrix.count || nextRow < 0)
                    || (nextColumn >= matrix[0].count || nextColumn < 0)
                    || visited.contains([nextRow, nextColumn]) {
                currentDirection = currentDirection == (direction.count - 1) ? 0 : currentDirection + 1
                directionToGo = direction[currentDirection]
                nextRow = currentPosition[0] + directionToGo.0
                nextColumn = currentPosition[1] + directionToGo.1
            }
            
            currentPosition = [nextRow, nextColumn]
            visited.insert([nextRow, nextColumn])
            toOutput.append(matrix[nextRow][nextColumn])
        }
        
        return toOutput
    }
}

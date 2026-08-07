class Solution {
    // 3:16 - 3:48
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        var queue = [(r: Int, c: Int)]()
        
        for (r, row) in grid.enumerated() {
            for (c, column) in row.enumerated() {
                if column == 0 {
                    queue.append((r: r, c: c))
                }
            }
        }
        
        bfs()
        
        func bfs() {
            var index = 0
            let directions = [(-1, 0),
                            (+1, 0),
                            (0, -1),
                            (0, +1)]
            
            while index < queue.count {
                let (row, column) = queue[index]
                index += 1
                
                for direction in directions {
                    let (newRow, newColumn) = (row + direction.0, column + direction.1)
                    guard newRow >= 0 && newColumn >= 0 && newRow < grid.count && newColumn < grid[newRow].count else { continue }
                    guard grid[newRow][newColumn] == 2147483647 else { continue }
                    
                    grid[newRow][newColumn] = grid[row][column] + 1
                    queue.append((r: newRow, c: newColumn))
                }
                
            }
        }
    }
}

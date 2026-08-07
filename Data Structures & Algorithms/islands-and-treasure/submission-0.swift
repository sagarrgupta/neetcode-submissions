class Solution {
    // 3:16 
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        var queue = [(r: Int, c: Int)]()
        
        for (r, row) in grid.enumerated() {
            for (c, column) in row.enumerated() {
                if column == 0 {
                    grid[r][c] = 1
                    queue.append((r: r, c: c))
                    bfs()
                }
            }
        }
        
        
        func bfs() {
            var value = 0
            
            while !queue.isEmpty {
                for _ in 0..<queue.count {
                    let (row, column) = queue.removeFirst()
                    guard row >= 0 && column >= 0 && row < grid.count && column < grid[row].count else { continue }
                    guard grid[row][column] > value && grid[row][column] != -1 else { continue }
                    
                    grid[row][column] = value
                    
                    // top
                    queue.append((r: row - 1, c: column))
                    
                    // bottom
                    queue.append((r: row + 1, c: column))
                    
                    // left
                    queue.append((r: row, c: column - 1))
                    
                    // right
                    queue.append((r: row, c: column + 1))
                }
                
                value += 1
            }
        }
    }
}

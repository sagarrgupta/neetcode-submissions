class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        
        var queue = [(r: Int, c: Int)]()
        var grid = grid
        
        for (r, row) in grid.enumerated() {
            for (c, column) in row.enumerated() {
                if column == 2 {
                    queue.append((r: r, c: c))
                }
            }
        }
        
        var minutes = 0
        
        func bfs() {
            let directions = [(-1, 0),
                            (+1, 0),
                            (0, -1),
                            (0, +1)]
            
            while !queue.isEmpty {
                for _ in 0..<queue.count {
                    let (r,c) = queue.removeFirst()
                    
                    for direction in directions {
                        let newR = r + direction.0
                        let newC = c + direction.1
                        
                        guard newR >= 0,
                            newR < grid.count,
                            newC >= 0,
                            newC < grid[newR].count else { continue }
                        
                        if grid[newR][newC] == 1 {
                            grid[newR][newC] = 2
                            queue.append((r: newR, c: newC))
                        }
                    }
                }
                
                if !queue.isEmpty {
                    minutes += 1
                }
            }
        }
        
        bfs()
        
        for (r, row) in grid.enumerated() {
            for (c, column) in row.enumerated() {
                if column == 1 {
                    return -1
                }
            }
        }
        
        return minutes
    }
}
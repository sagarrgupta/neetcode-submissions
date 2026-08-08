class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var region = 0
        var grid = grid
        for (r, row) in grid.enumerated() {
            for (c, column) in row.enumerated() {
                if grid[r][c] == "1" {
                    region += 1
                    dfs(r, c)
                }
            }
        }
        
        func dfs(_ row: Int, _ column: Int) {
            guard row < grid.count,
                row >= 0,
                column < grid[row].count,
                column >= 0,
                grid[row][column] == "1" else { return }
            grid[row][column] = "0"
            let directions = [(-1, 0),
                            (+1, 0),
                            (0, -1),
                            (0, +1)]
            
            for direction in directions {
                dfs(row + direction.0, column + direction.1)
            }
        }
        return region
    }
}

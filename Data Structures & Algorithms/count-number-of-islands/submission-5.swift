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
            
            dfs(row - 1, column)
            dfs(row + 1, column)
            dfs(row, column - 1)
            dfs(row, column + 1)
        }
        return region
    }
}

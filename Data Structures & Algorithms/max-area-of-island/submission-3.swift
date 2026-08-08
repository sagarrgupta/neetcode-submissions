class Solution {
    enum State {
        case notVisited
        case visited
    }

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty,
            !grid[0].isEmpty else { return 0 }
        var maxArea = 0
        var status = Array(repeating: Array(repeating: State.notVisited, count: grid[0].count), count: grid.count)
        
        for (r, row) in grid.enumerated() {
            for (c, column) in row.enumerated() {
                if status[r][c] == .notVisited && column == 1 {
                    maxArea = max(dfs(r, c), maxArea)
                }
            }
        }
        
        func dfs(_ r: Int, _ c: Int) -> Int {
            guard r >= 0 && c >= 0 && r < grid.count && c < grid[r].count else { return 0 }
            guard grid[r][c] == 1 && status[r][c] == .notVisited else { return 0 }
            status[r][c] = .visited
            
            let directions = [(-1, 0),
                            (+1, 0),
                            (0,-1),
                            (0,+1)]
            
            var toReturn = 1
            for direction in directions {
                toReturn += dfs(r + direction.0, c + direction.1)
            }
            
            status[r][c] = .visited
            return toReturn
        }
        
        return maxArea
    }
}

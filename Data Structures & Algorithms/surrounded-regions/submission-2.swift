class Solution {
    func solve(_ board: inout [[Character]]) {
        for (r, row) in board.enumerated() {
            for (c, column) in row.enumerated() {
                if (r == 0 || r == board.count - 1 || c == 0 || c == row.count - 1) && column == "O" {
                    dfs(r: r, c: c)
                }
            }
        }
        
        func dfs(r: Int, c: Int) {
            guard r >= 0, r < board.count, c >= 0, c < board[r].count, board[r][c] == "O" else { return }
            board[r][c] = "T"
            dfs(r: r - 1, c: c)
            dfs(r: r + 1, c: c)
            dfs(r: r, c: c - 1)
            dfs(r: r, c: c + 1)
        }
        
        for (r, row) in board.enumerated() {
            for (c, column) in row.enumerated() {
                if column == "O" {
                    board[r][c] = "X"
                }
                
                if column == "T" {
                    board[r][c] = "O"
                }
            }
        }
    }
}

class Solution {
    func solve(_ board: inout [[Character]]) {
        var toReverse = Set<[Int]>()
        
        for (r, row) in board.enumerated() {
            for (c, column) in row.enumerated() {
                if (r == 0 || r == board.count - 1 || c == 0 || c == row.count - 1) && column == "O" {
                    dfs(r: r, c: c)
                }
            }
        }
        
        func dfs(r: Int, c: Int) {
            guard r >= 0, r < board.count, c >= 0, c < board[r].count, board[r][c] == "O" else { return }
            toReverse.insert([r,c])
            board[r][c] = "X"
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
                
                if toReverse.contains([r,c]) {
                    board[r][c] = "O"
                }
            }
        }
    }
}

struct VisitedNode: Hashable {
    let row: Int
    let column: Int
}

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard board.count > 0,
            board[0].count > 0 else { return false }
        
        let wordArray = Array(word)
        
        guard wordArray.count > 0 else { return false }
        
        var visitedNodes = [VisitedNode: Bool]()
        
        for (r, row) in board.enumerated() {
            for (c, column) in row.enumerated() {
                if wordArray[0] == column && dfs(VisitedNode(row: r, column: c), toFindWordIndex: 1) {
                    return true
                }
            }
        }
        
        func dfs(_ node: VisitedNode, toFindWordIndex: Int) -> Bool {
            if toFindWordIndex == wordArray.count { return true }
            visitedNodes[node, default: false] = true
            let topNeighbour = VisitedNode(row: node.row - 1, column: node.column)
            if !visitedNodes[topNeighbour, default: false],
            let letter = getLetter(board: board, ofNode: topNeighbour),
            letter == wordArray[toFindWordIndex],
            dfs(topNeighbour, toFindWordIndex: toFindWordIndex + 1) {
                return true
            }
            
            let bottomNeighbour = VisitedNode(row: node.row + 1, column: node.column)
            if !visitedNodes[bottomNeighbour, default: false],
            let letter = getLetter(board: board, ofNode: bottomNeighbour),
            letter == wordArray[toFindWordIndex],
            dfs(bottomNeighbour, toFindWordIndex: toFindWordIndex + 1) {
                return true
            }
            
            let leftNeighbour = VisitedNode(row: node.row, column: node.column - 1)
            if !visitedNodes[leftNeighbour, default: false],
            let letter = getLetter(board: board, ofNode: leftNeighbour),
            letter == wordArray[toFindWordIndex],
            dfs(leftNeighbour, toFindWordIndex: toFindWordIndex + 1) {
                return true
            }
            
            let rightNeighbour = VisitedNode(row: node.row, column: node.column + 1)
            if !visitedNodes[rightNeighbour, default: false],
            let letter = getLetter(board: board, ofNode: rightNeighbour),
            letter == wordArray[toFindWordIndex],
            dfs(rightNeighbour, toFindWordIndex: toFindWordIndex + 1) {
                return true
            }
            
            visitedNodes[node, default: false] = false
            return false
        }
        
        return false
    }

    func getLetter(board: [[Character]], ofNode: VisitedNode) -> Character? {
        guard ofNode.row >= 0 &&
                ofNode.column >= 0 &&
                ofNode.row < board.count &&
                ofNode.column < (board[ofNode.row].count) else { return nil }
        return board[ofNode.row][ofNode.column]
    }
}

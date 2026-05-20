class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var checkRow: Set<Character> = Set()
        var checkColumn: [[Character]] = Array(repeating: ["."], count: board.count)
        let sizeOfEachSudoku = 3
        
        for (indexI, everyRow) in board.enumerated() {
            checkRow.removeAll()
            for (indexJ, everyNumber) in everyRow.enumerated() {
                if indexI % sizeOfEachSudoku == 0 && indexJ % sizeOfEachSudoku == 0 {
                    guard checkOneBox(startIndexI: indexI, startIndexJ: indexJ, board: board) else { return false }
                }
                
                guard everyNumber.isNumber else { continue }
                if checkRow.contains(everyNumber) { return false }
                checkRow.insert(everyNumber)
                if checkColumn[indexJ].contains(everyNumber) {
                    return false
                } else {
                    checkColumn[indexJ].append(everyNumber)
                }
            }
        }
        return true
    }

    func checkOneBox(startIndexI: Int, startIndexJ: Int, board: [[Character]]) -> Bool {
        var characters: Set<Character> = Set()
        for i in startIndexI..<(startIndexI+3) {
            for j in startIndexJ..<(startIndexJ+3) {
                let character = board[i][j]
                guard character.isNumber else { continue }
                if characters.contains(character) { return false }
                characters.insert(character)
            }
        }
        return true
    }
}

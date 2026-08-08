class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        let rows = grid.count
        let columns = grid[0].count
        let unionSet = DisjointUnion(rows * columns)
        var totalRegion = rows * columns
        
        let directions = [(-1, 0),
                        (+1, 0),
                        (0, -1),
                        (0, +1)]

        for (r, row) in grid.enumerated() {
            for (c, column) in row.enumerated() {
                if column == "1" {
                    for dir in directions {
                        let newR = r + dir.0
                        let newC = c + dir.1

                        guard newR >= 0, 
                        newR < rows, 
                        newC >= 0, 
                        newC < columns,
                        grid[newR][newC] == "1" else { continue }
                        
                        let index = r * columns + c
                        let newIndex = newR * columns + newC
                        if unionSet.union(index, newIndex) {
                            totalRegion -= 1
                        }
                    }
                } else {
                    totalRegion -= 1
                }
            }
        }

        return totalRegion
    }
}

class DisjointUnion {
    var parent = [Int]()
    var size = [Int]()

    init(_ n: Int) {
        parent = Array(0..<n)
        size = Array(repeating: 1, count: n)
    }

    func find(_ ofElement: Int) -> Int {
        if parent[ofElement] != ofElement {
            parent[ofElement] = find(parent[ofElement])
        }
        return parent[ofElement]
    }

    func union(_ entity1: Int, _ entity2: Int) -> Bool {
        let root1 = find(entity1)
        let root2 = find(entity2)

        guard root1 != root2 else { return false }

        if size[root1] >= size[root2] {
            parent[root2] = root1
            size[root1] += size[root2]
        } else {
            parent[root1] = root2
            size[root2] += size[root1]
        }
        return true
    }
}

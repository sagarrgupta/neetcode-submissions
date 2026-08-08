// 2:25
class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        guard !heights.isEmpty else { return [[]]}
        
        var pacificReachable = Set<[Int]>()
        var atlanticReachable = Set<[Int]>()
        
        // pacific
        var pacificQueue = [[Int]]()
        for r in 0..<heights.count {
            pacificQueue.append([r,0])
        }
        
        for c in 0..<heights[0].count {
            pacificQueue.append([0,c])
        }
        
        // atlantic
        var atlanticQueue = [[Int]]()
        for r in 0..<heights.count {
            atlanticQueue.append([r,heights[0].count - 1])
        }
        
        for c in 0..<heights[0].count {
            atlanticQueue.append([heights.count - 1, c])
        }
        
        func bfs(queue: [[Int]], toAppendIn: inout Set<[Int]>) {
            var queue = queue
            var index = 0
            let directions = [(-1, 0),
                            (+1, 0),
                            (0, -1),
                            (0, +1)]
            
            while index < queue.count {
                let r = queue[index][0]
                let c = queue[index][1]
                index += 1
                
                guard !toAppendIn.contains([r,c]) else { continue }
                toAppendIn.insert([r,c])
                
                for direction in directions {
                    let newR = r + direction.0
                    let newC = c + direction.1
                    
                    guard newR >= 0,
                        newC >= 0,
                        newR < heights.count,
                        newC < heights[newR].count else { continue }
                    
                    if heights[newR][newC] >= heights[r][c] {
                        queue.append([newR,newC])
                    }
                }
            }
        }
        
        bfs(queue: pacificQueue, toAppendIn: &pacificReachable)
        bfs(queue: atlanticQueue, toAppendIn: &atlanticReachable)
        
        var results = [[Int]]()
        for node in pacificReachable {
            if atlanticReachable.contains(node) {
                results.append(node)
            }
        }
        
        return results
    }
}

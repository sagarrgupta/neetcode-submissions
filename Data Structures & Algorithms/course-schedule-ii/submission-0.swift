class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var graph = Array(repeating: [Int](), count: numCourses)
        
        for prerequisite in prerequisites {
            let parent = prerequisite[1]
            let child = prerequisite[0]
            
            graph[parent].append(child)
        }
        
        var finalOrder = [Int]()
        var state = Array(repeating: 0, count: numCourses) // 0 - not visited, 1 - visiting, 2 - visited
        
        func dfs(parent: Int, state: inout [Int]) -> Bool {
            guard state[parent] != 1 else { return false }
            guard state[parent] != 2 else { return true }
            state[parent] = 1
            
            for childCourse in graph[parent] {
                if !dfs(parent: childCourse, state: &state) {
                    return false
                }
            }
            finalOrder.append(parent)
            state[parent] = 2
            return true
        }
        
        for i in 0..<numCourses {
            if !dfs(parent: i, state: &state) {
                return []
            }
        }
        
        return finalOrder.reversed()
    }
}

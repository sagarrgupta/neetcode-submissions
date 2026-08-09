class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var graph = [Int: [Int]]()
        var indegree = Array(repeating: 0, count: numCourses)
        
        for prerequisite in prerequisites {
            guard prerequisite.count > 1 else { continue }
            graph[prerequisite[1], default: []].append(prerequisite[0])
            indegree[prerequisite[0]] += 1
        }
        
        var completedCourses = 0
        var coursesFreeToTake = [Int]()
        
        for (index, course) in indegree.enumerated() {
            if course == 0 {
                coursesFreeToTake.append(index)
            }
        }
        
        var index = 0
        while index < coursesFreeToTake.count {
            completedCourses += 1
            
            for indegreeCourse in graph[coursesFreeToTake[index]] ?? [Int]() {
                indegree[indegreeCourse] -= 1
                
                if indegree[indegreeCourse] == 0 {
                    coursesFreeToTake.append(indegreeCourse)
                }
            }
            
            index += 1
        }
        
        return numCourses == completedCourses
    }
}

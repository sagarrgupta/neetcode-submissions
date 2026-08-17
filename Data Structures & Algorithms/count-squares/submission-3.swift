class CountSquares {
    var points = [[Int]: Int]()

    func add(_ point: [Int]) {
        points[point, default: 0] += 1
    }

    func count(_ point: [Int]) -> Int {
        var count = 0
        
        for p in points {
            if point == p.key {
                continue
            }
            let coordinates = p.key
            if abs(point[0] - coordinates[0]) == abs(point[1] - coordinates[1]),
               let topCorner = points[[point[0], coordinates[1]]],
               let bottomCorner = points[[coordinates[0], point[1]]] {
                count += p.value * topCorner * bottomCorner
            }
        }
        return count
    }
}
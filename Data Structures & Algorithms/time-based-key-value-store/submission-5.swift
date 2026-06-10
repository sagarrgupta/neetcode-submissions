class TimeMap {
    var values: [String: [(String, Int)]]

    init() {
        values = [String: [(String, Int)]]()
    }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        var valuesToUpdate = values[key] ?? []
        valuesToUpdate.append((value, timestamp))
        values[key, default: []] = valuesToUpdate
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        guard let values = values[key] else { return "" }
        var l = 0
        var r = values.count - 1
        var valueToReturn = ""
        
        while l <= r {
            let mid = ((r - l) / 2) + l
            
            if values[mid].1 <= timestamp {
                valueToReturn = values[mid].0
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        
        return valueToReturn
    }
}
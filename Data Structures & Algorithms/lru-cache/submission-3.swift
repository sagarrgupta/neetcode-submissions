class LRUCache {
    var recentUsed = [Int]()
    var capacity: Int
    var hashMap = [Int: Int]()

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        defer {
            if let index = recentUsed.firstIndex(of: key) {
                let value = recentUsed.remove(at: index)
                recentUsed.insert(value, at: 0)
            }
        }
        return hashMap[key] ?? -1
    }

    func put(_ key: Int, _ value: Int) {
        if let _ = hashMap[key] {
            hashMap[key] = value
            if let index = recentUsed.firstIndex(of: key) {
                let value = recentUsed.remove(at: index)
                recentUsed.insert(value, at: 0)
            }
        } else {
            hashMap[key] = value
            recentUsed.insert(key, at: 0)
            if recentUsed.count > capacity {
                if let value = recentUsed.popLast() {
                    hashMap.removeValue(forKey: value)
                }
            }
        }
    }
}
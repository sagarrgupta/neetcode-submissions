class MinStack {
    var values: [Int]
    var min: Int? = nil

    init() {
        self.values = [Int]()
        self.min = nil
    }

    func push(_ val: Int) {
        values.insert(val, at: 0)
        updateMin(val)
    }

    func pop() {
        guard !values.isEmpty else { return }
        values.remove(at: 0)
        min = nil
        for value in values {
            updateMin(value)
        }
    }

    func top() -> Int {
        guard !values.isEmpty else { return 0 }
        return values[0]
    }

    func getMin() -> Int {
        return min ?? 0
    }
    
    func updateMin(_ val: Int) {
        if min == nil {
            min = val
        } else if val < (min ?? 0) {
            min = val
        }
    }
}
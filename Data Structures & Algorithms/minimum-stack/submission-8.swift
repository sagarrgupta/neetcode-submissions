class MinStack {
    var values: [Int]
    var minStack: [Int]

    init() {
        self.values = [Int]()
        self.minStack = [Int]()
    }

    func push(_ val: Int) {
        values.insert(val, at: 0)
        updateMin(val)
    }

    func pop() {
        guard !values.isEmpty else { return }
        values.remove(at: 0)
        minStack.popLast()
    }

    func top() -> Int {
        guard !values.isEmpty else { return 0 }
        return values[0]
    }

    func getMin() -> Int {
        return minStack.last ?? 0
    }
    
    func updateMin(_ val: Int) {
        let min = min(val, minStack.last ?? val)
        minStack.append(min)
    }
}
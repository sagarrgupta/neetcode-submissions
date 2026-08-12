//11:43
class Solution {
    class TrieNode: Hashable {
        var children = [Character: TrieNode]()
        var isAWord = false
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(self))
        }
        
        static func == (lhs: TrieNode, rhs: TrieNode) -> Bool {
            lhs === rhs
        }
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var root = TrieNode()
        var failures = Set<Int>()
        
        for word in wordDict {
            addWord(&root, Array(word))
        }
        
        var charsToFind = Array(s)
        return recursiveSearch(root, toSearch: charsToFind, toStartFrom: 0, failures: &failures)
    }

    func recursiveSearch(_ root: TrieNode, toSearch: [Character], toStartFrom: Int, failures: inout Set<Int>) -> Bool {
        guard toStartFrom < toSearch.count else { return true }

        if failures.contains(toStartFrom) {
            return false
        }
        
        var current = root
        
        for index in toStartFrom..<toSearch.count {
            let char = toSearch[index]
            
            guard let node = current.children[char] else {
                failures.insert(toStartFrom)
                return false
            }
            
            current = node
            
            if current.isAWord {
                if recursiveSearch(root, toSearch: toSearch, toStartFrom: index + 1, failures: &failures) {
                    return true
                }
            }
        }
        
        failures.insert(toStartFrom)
        return false
    }

    func addWord(_ root: inout TrieNode, _ wordToAdd: [Character]) {
        var current = root
        
        for char in wordToAdd {
            if let node = current.children[char] {
                current = node
            } else {
                let newNode = TrieNode()
                current.children[char] = newNode
                current = newNode
            }
        }
        current.isAWord = true
    }
}

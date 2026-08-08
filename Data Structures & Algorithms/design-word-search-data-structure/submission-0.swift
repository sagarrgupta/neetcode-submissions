class TrieNode {
    var children = [Character: TrieNode]()
    var isAWord = false
}

class WordDictionary {
    private let root = TrieNode()
    
    func addWord(_ word: String) {
        var current = root
        
        for char in word {
            if let child = current.children[char] {
                current = child
            } else {
                let newTree = TrieNode()
                current.children[char] = newTree
                current = newTree
            }
        }
        
        current.isAWord = true
    }

    func search(_ word: String) -> Bool {
        let characters = Array(word)
        
        func dfs(_ index: Int, _ current: TrieNode) -> Bool {
            if index == word.count {
                return current.isAWord
            }
            
            let char = characters[index]
            
            if char == "." {
                for child in current.children.values {
                    if dfs(index + 1, child) {
                        return true
                    }
                }
                return false
            }
            
            guard let child = current.children[char] else { return false }
            return dfs(index + 1, child)
        }
        
        return dfs(0, root)
    }
}
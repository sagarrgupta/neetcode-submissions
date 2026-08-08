class TrieNode {
    var children = [Character: TrieNode]()
    var isAWord = false
}

class PrefixTree {
    private let root = TrieNode()

    func insert(_ word: String) {
        var current = root

        for char in word {
            if let child = current.children[char] {
                current = child
            } else {
                let newNode = TrieNode()
                current.children[char] = newNode
                current = newNode
            }
        }

        current.isAWord = true
    }

    func search(_ word: String) -> Bool {
        var current = root

        for char in word {
            if let child = current.children[char] {
                current = child
            } else {
                return false
            }
        }

        return current.isAWord
    }

    func startsWith(_ prefix: String) -> Bool {
        var current = root

        for char in prefix {
            if let child = current.children[char] {
                current = child
            } else {
                return false
            }
        }

        return true
    }
}

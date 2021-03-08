var visited = [String: Bool]()
var _words = [String]()
var targetWord = ""
var answer = [Int]()

func isConverible(_ a: String, _ b: String) -> Bool {
    let first = Array(a)
    let second = Array(b)
    var cnt = 0
    
    for (f, s) in zip(first, second) {
        if f != s { cnt += 1 }
    }
    
    return cnt == 1 ? true : false
}

func dfs(_ depth: Int, _ cWord: String) {
    
    if cWord == targetWord {
        answer.append(depth)
    }
    
    for word in _words {
        guard !visited[word]! && isConverible(cWord, word) else { continue }
        
        visited[cWord] = true
        dfs(depth + 1, word)
        visited[cWord] = false
    }
}


func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    targetWord = target
    words.forEach {
        visited[$0] = false
    }
    _words = words

    dfs(0, begin)
    
    return answer.min() ?? 0
}

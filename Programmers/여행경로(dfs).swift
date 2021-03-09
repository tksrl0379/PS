var _tickets = [[String]]()
var visited = [Bool]()
var answer = [String]()
var answers = [[String]]()

func dfs(_ depth: Int, _ index: Int) {
    answer[depth] = _tickets[index][0]
    
    if depth == _tickets.count - 1 {
        answer[_tickets.count] = _tickets[index][1]
        answers.append(answer)
        return
    }
    
    let dest = _tickets[index][1]
    for i in 0..<_tickets.count {
        guard !visited[i] && _tickets[i][0] == dest else { continue }
        
        visited[i] = true
        dfs(depth + 1, i)
        visited[i] = false
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    _tickets = tickets
    visited = [Bool](repeating: false, count: tickets.count + 1)
    answer = [String](repeating: "", count: tickets.count + 1)
    
    (0..<tickets.count).forEach {
        guard tickets[$0][0] == "ICN" else { return }
        visited[$0] = true
        dfs(0, $0)
        visited[$0] = false
    }
    
    return answers.sorted { $0.reduce("") { $0 + $1 } < $1.reduce("") { $0 + $1 } }.first!
}

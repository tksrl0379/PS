var matrix = [[Int]]()
var visited = [Bool]()
var len = 0

func dfs(_ node: Int) {
    
    visited[node] = true
    
    for i in 0..<len {
        guard !visited[i] && matrix[node][i] == 1 else { continue }
        
        dfs(i)
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    len = n
    matrix = computers
    visited = [Bool](repeating: false, count: n)
    
    var ans = 0
    (0..<n).forEach {
        guard !visited[$0] else { return }
        
        ans += 1
        dfs($0)
    }
    
    return ans
}

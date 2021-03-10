let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = inputs[0]
let M = inputs[1]
let V = inputs[2]

var matrix = [[Int]](repeating: [Int](repeating: 0, count: N + 1), count: N + 1)
(0..<M).forEach { _ in
    let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }
    matrix[inputs[0]][inputs[1]] = 1
    matrix[inputs[1]][inputs[0]] = 1
}

var visited = [Bool](repeating: false, count: N + 1)


func dfs(_ start: Int) {
    
    visited[start] = true
    print(start, terminator: " ")
    
    for i in 1...N {
        guard !visited[i] && matrix[start][i] == 1 else { continue }
        
        dfs(i)
    }
}


func bfs(_ startNode: Int) {
    
    var queue = [Int]()
    queue.append(startNode)
    visited[startNode] = true
    print(startNode, terminator: " ")
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        for adjNode in 1...N {
            guard !visited[adjNode] && matrix[node][adjNode] == 1 else { continue }
            
            visited[adjNode] = true
            print(adjNode, terminator: " ")
            queue.append(adjNode)
        }
    }
}

dfs(V)
print()
visited = [Bool](repeating: false, count: N + 1)
bfs(V)

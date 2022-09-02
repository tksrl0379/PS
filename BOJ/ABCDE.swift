// https://www.acmicpc.net/problem/13023
// depth가 4인 경우가 있는지를 찾는 문제
// depth를 구하는 문제라 DFS로 풀이
// 0 > 1 > 2 > 3 > 0 같은 경우는 성립 X
// 탐색 후 찾지 못한 경우(depth가 4가 되지 못한 경우) 해당 노드들을 다시 방문해야 하기 때문에 visited를 다시 false로 만들어 줘야 함


let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0] // 정점
let M = input[1] // 간선

var matrix: [[Int]] = .init(repeating: [], count: N + 1)
var visited: [Bool] = .init(repeating: false, count: N)

(0..<M).forEach { _ in
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    matrix[line[0]].append(line[1])
    matrix[line[1]].append(line[0])
}


func solution() -> Int {
    var checked: Bool = false
    func dfs(_ start: Int, depth: Int) {
        visited[start] = true

        if depth == 4 {
            checked = true
            return
        }
        
        for node in matrix[start] {
            if visited[node] == false {
                dfs(node, depth: depth + 1)
            }
        }
        
        
        visited[start] = false
    }
    
    for node in (0..<N) {
        if checked {
            return 1
        }
        dfs(node, depth: 0)
    }
    return 0
}

print(solution())

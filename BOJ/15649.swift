// https://www.acmicpc.net/problem/15649

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = input[0]
let M = input[1]
var visited = Array(repeating: false, count: N+1)
var ary = Array(repeating: 0, count: M)

func dfs(depth: Int) {
    
    if depth == M {
        ary.forEach { print($0, terminator: " ")}
        print()
        return
    }
    
    for i in 1...N {
        if !visited[i] {
            visited[i] = true
            ary[depth] = i
            dfs(depth: depth+1)
            visited[i] = false
        }
    }
}

dfs(depth: 0)

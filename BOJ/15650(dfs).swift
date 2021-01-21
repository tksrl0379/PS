// https://www.acmicpc.net/problem/15650

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0]
let M = input[1]

var seq = Array(repeating: 0, count: M) // M 개
var visited = Array(repeating: false, count: N+1) // 1...N

func dfs(start: Int, depth: Int) {
  
  if depth == M {
    print(seq.map { String($0) }.joined(separator: " "))
    return
  }
  
  for index in start...N {
    guard !visited[index] else { continue }

    seq[depth] = index
    visited[index] = true
    dfs(start: index, depth: depth+1)
    visited[index] = false
  }
}

dfs(start: 1, depth: 0)

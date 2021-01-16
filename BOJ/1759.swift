// https://www.acmicpc.net/problem/1759

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let L = input[0] // L 개 선택
let C = input[1] // 총 C 개의 문자 중
let seq = readLine()!.split(separator: " ").map { String($0) }.sorted { $0 < $1 }

var visited = Array(repeating: false, count: C)
var str = Array(String(repeating: " ", count: L))
let characters = Array("aeiou")

func dfs(start: Int, depth: Int) {
  
  if depth == L {
    // 모음 자음 개수 확인 후 충족하면 출력
    let counts = Set(str).intersection(characters).count
    if counts >= 1 && (L-counts) >= 2 {
      print(String(str))
    }

    return
  }
  
  for index in start..<C {
    guard !visited[index] else { continue }
    
    str[depth] = Character(seq[index])
    visited[index] = true
    dfs(start: index+1, depth: depth+1)
    visited[index] = false
  }
}

dfs(start: 0, depth: 0)

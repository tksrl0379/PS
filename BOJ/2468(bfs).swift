// https://www.acmicpc.net/problem/2468

let N = Int(readLine()!)!

var matrix = [[Int]]()
var visited = [[Bool]]()

(0..<N).forEach { _ in
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  matrix.append(input)
}

func bfs(home: (y: Int, x: Int), height: Int) {
  var queue = [(y: Int, x: Int)]()
  queue.append(home)
  visited[home.y][home.x] = true
  
  let dx = [-1, 0, 1, 0]
  let dy = [0, 1, 0, -1]
  
  
  while !queue.isEmpty {
    
    let home = queue.removeFirst()
    
    for index in (0..<4) {
      let nx = home.x + dx[index]
      let ny = home.y + dy[index]
      
      guard (0..<N) ~= nx && (0..<N) ~= ny,
            !visited[ny][nx] && matrix[ny][nx] > height else { continue }
      visited[ny][nx] = true
      queue.append((ny, nx))
    }
  }
}

var result = [Int]()

for height in (0...100) {
  var cnt = 0
  visited = Array(repeating: Array(repeating: false, count: N), count: N)
  for i in (0..<N) {
    for j in (0..<N) {
      if !visited[i][j] && matrix[i][j] > height {
        bfs(home: (i, j), height: height)
        cnt += 1
      }
    }
  }
  result.append(cnt)
}

print(result.max()!)

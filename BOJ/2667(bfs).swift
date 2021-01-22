// https://www.acmicpc.net/problem/2667

import Foundation

let N = Int(readLine()!)!

var matrix = [[Int]]()

(0..<N).forEach { _ in
  let input = readLine()!.map { Int(String($0))! }
  matrix.append(input)
}

func bfs(home: (y: Int, x: Int)) -> Int {
  var counts = 1
  var queue = [(y: Int, x: Int)]()
  queue.append(home)
  matrix[home.y][home.x] = 0
  
  let dx = [-1, 0, 1, 0]
  let dy = [0, 1, 0, -1]
 
  while !queue.isEmpty {
    
    let home = queue.removeFirst()
    
    for index in (0..<4) {
      let ny = home.y + dy[index]
      let nx = home.x + dx[index]
      
      guard (0..<N) ~= ny && (0..<N) ~= nx,
            matrix[ny][nx] == 1 else { continue }
      counts += 1
      matrix[ny][nx] = 0
      queue.append((ny, nx))
    }
  }
  return counts
}

var result = [Int]()
for i in (0..<N) {
  for j in (0..<N) {
    if matrix[i][j] == 1 {
      result.append(bfs(home: (i, j)))
    }
  }
}

result.sort { $0 < $1 }
print(result.count)
result.forEach {
  print($0)
}

// https://www.acmicpc.net/problem/15686

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0] // N x N
let M = input[1] // 최대 M 개

var matrix = [[Int]]()
(0..<N).forEach { _ in
  let row = readLine()!.split(separator: " ").map { Int(String($0))! }
  matrix.append(row)
}

var chickens = [(y: Int, x: Int)]()
var homes = [(y: Int, x: Int)]()

for y in (0..<N) {
  for x in (0..<N) {
    if matrix[y][x] == 2 {
      chickens.append((y, x))
    } else if matrix[y][x] == 1 {
      homes.append((y, x))
    }
  }
}

var visited = Array(repeating: false, count: chickens.count)
var selectedChickens: [(y: Int, x: Int)] = Array(repeating: (0,0), count: M)
var totalDistance = Int.max

func calDistance() {
  var distance = 0
  for home in homes {
    var minDistance = Int.max
    
    for chicken in selectedChickens {
      let tmpDistance = abs(home.y - chicken.y) + abs(home.x - chicken.x)
      minDistance = min(minDistance, tmpDistance)
    }
    distance += minDistance
  }
  totalDistance = min(totalDistance, distance)
}

func dfs(start: Int, depth: Int) {
  
  if depth == M {
    // M개로 이루어진 치킨 집 위치 조합을 가지고 치킨거리 계산
    calDistance()
    return
  }
  
  for index in (start..<chickens.count) {
    guard !visited[index] else { continue }
    
    selectedChickens[depth] = chickens[index]
    visited[index] = true
    dfs(start: index + 1, depth: depth + 1)
    visited[index] = false
  }
}

dfs(start: 0, depth: 0)
print(totalDistance)

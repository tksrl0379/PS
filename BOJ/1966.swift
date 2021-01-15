// https://www.acmicpc.net/problem/1966

let T = Int(readLine()!)!

(0..<T).forEach { _ in
  let MN = readLine()!.split(separator: " ").map { Int($0)! }
  let N = MN[1]
  
  var queue: [(value: Int, isTrue: Bool)] = readLine()!
    .split(separator: " ")
    .map { (Int($0)!, false) }
  queue[N].isTrue = true
  
  var counts = 0
  while !queue.isEmpty {
    
    let max = queue.max { $0.value < $1.value }!.value
    let document = queue.removeFirst()
    
    if document.value < max {
      queue.append(document)
    } else {
      counts += 1
      
      if document.isTrue {
        print(counts)
        break
      }
    }
  }
}

// https://www.acmicpc.net/problem/2217

let N = Int(readLine()!)!
var ropes = [Int]()
(0..<N).forEach { _ in
    ropes.append(Int(readLine()!)!)
}

ropes.sort()

var answer = 0
for index in (0..<N) {
    let count = N - index
    
    answer = max(answer, ropes[index] * count)
}
print(answer)

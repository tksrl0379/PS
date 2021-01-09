// https://www.acmicpc.net/problem/17298


let N = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

var stack = [0] // 인덱스가 들어감
var result = [Int](repeating: -1, count: N)
(1..<N).forEach {
    
    while !stack.isEmpty && seq[stack.last!] < seq[$0] {
        let removedIndex = stack.removeLast()
        result[removedIndex] = seq[$0]
    }
    
    stack.append($0)
}

print(result.map { String($0) }.joined(separator: " "))

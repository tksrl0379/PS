// https://www.acmicpc.net/problem/1138


let N = Int(readLine()!)!
let ary = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

var answer = [Int](repeating: 0, count: N)

var index = N
while index > 0 {
    
    let count = ary[index-1]
    if answer[count] == 0 {
        answer[count] = index
    } else {
        (count..<N-1).reversed().forEach { answer[$0 + 1] = answer[$0] }
        answer[count] = index
    }
    index -= 1
}
answer.forEach { print($0, terminator: " ") }

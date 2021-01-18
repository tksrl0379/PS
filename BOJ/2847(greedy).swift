// https://www.acmicpc.net/problem/2847


let N = Int(readLine()!)!
var seq = [Int]()
(0..<N).forEach { _ in
    seq.append(Int(readLine()!)!)
}

var value = seq.last! - 1
var index = N - 2
var count = 0

while index >= 0 {
    
    if seq[index] > value {
        count += (seq[index] - value)
        value -= 1
    } else {
        value = seq[index] - 1
    }
    
    index -= 1
}

print(count)

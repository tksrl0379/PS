// https://www.acmicpc.net/problem/15903

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let n = input[0], m = input[1]

var seq = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

(0..<m).forEach { _ in
    seq.sort()
    
    let new = seq[0] + seq[1]
    seq[0] = new
    seq[1] = new
    
}

print(seq.reduce(0) { $0 + $1 })

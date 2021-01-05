// https://www.acmicpc.net/problem/3273

let n = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()
let x = Int(readLine()!)!

var start = 0
var end = n - 1
var count = 0

while end > start {
    let sum = seq[start] + seq[end]
    
    if sum == x { count += 1 }
    
    if sum > x { end -= 1 }
    else { start += 1 }
}

print(count)

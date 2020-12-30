// https://www.acmicpc.net/problem/1806


import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let S = input[1]

let seq = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

var start = 0
var minLength = Int.max
var sum = seq[start]

for end in (1..<N) {
    sum += seq[end]
    
    while sum >= S && end >= start { 
        let length = end - start + 1
        
        minLength = min(minLength, length)
        
        sum -= seq[start]
        start += 1
    }
}
print(minLength == Int.max ? 0 : minLength)

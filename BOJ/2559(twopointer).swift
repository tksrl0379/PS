// https://www.acmicpc.net/problem/2559

import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let K = input[1]

let seq = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

var start = 0
var sum = seq[0..<K].reduce(0) { $0 + $1 }
var maxSum = sum

for end in K..<N {
    
    sum += (seq[end] - seq[start])
    
    maxSum = max(maxSum, sum)
    
    start += 1
}

print(maxSum)

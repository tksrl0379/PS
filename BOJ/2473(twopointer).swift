// https://www.acmicpc.net/problem/2473

import Foundation

let N = Int(readLine()!)!
let seq = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()

var minAbsSum = Int.max
var answer = (0, 0, 0)
for fix in (0..<N-2) {
    var start = fix + 1
    var end = N-1
    
    while end > start {
        let sum = seq[fix] + seq[start] + seq[end]
        
        if minAbsSum > abs(sum) {
            minAbsSum = abs(sum)
            answer = (seq[fix], seq[start], seq[end])
        }
        
        if sum > 0 {
            end -= 1
        } else if sum < 0 {
            start += 1
        } else {
            break
        }
    }
}

print(answer.0, answer.1, answer.2)

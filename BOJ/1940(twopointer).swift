// https://www.acmicpc.net/problem/1940

import Foundation

let N = Int(readLine()!)!
let M = Int(readLine()!)!
let materials = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()

var start = 0
var end = N - 1
var sum = 0
var counts = 0

while end > start {
    sum = materials[start] + materials[end]
    if sum == M {
        counts += 1
        end -= 1
    } else if sum > M {
        end -= 1
    } else {
        start += 1
    }
}

print(counts)

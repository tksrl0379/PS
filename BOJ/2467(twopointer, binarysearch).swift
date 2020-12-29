// https://www.acmicpc.net/problem/2467


// 1차 정답: 투포인터

import Foundation

let N = Int(readLine()!)!
let values = readLine()!.split(separator: " ").compactMap { Int($0) }

var start = 0
var end = N - 1
var minAbsSum = Int.max
var minIndex = (first: 0, second: N - 1)

while start < end {
    
    let sum = values[start] + values[end]
    if minAbsSum > abs(sum) {
        minAbsSum = abs(sum)
        minIndex = (start, end)
    }
    
    if sum > 0 {
        end -= 1
    } else {
        start += 1
    }
}
print(values[minIndex.first], values[minIndex.second])



// 2차 정답: 이분탐색(binary search)

import Foundation

let N = Int(readLine()!)!
let values = readLine()!.split(separator: " ").compactMap { Int($0) }

var minIndex = (first: 0, second: N - 1)
var minAbsSum = Int.max

(0..<N).forEach {
    var start = $0 + 1
    var end = N - 1
    
    while end >= start {
        let mid = (end + start) / 2
        let sum = values[$0] + values[mid]
        
        if minAbsSum > abs(sum) {
            minAbsSum = abs(sum)
            minIndex = ($0, mid)
        }
        
        if sum > 0 {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
}

print(values[minIndex.first], values[minIndex.second])



// https://www.acmicpc.net/problem/1654

import Foundation

func totalCount(length: Int) -> Int {
    return lines.reduce(0) { $0 + ($1 / length) }
}

func binarySearch(target: Int) -> Int {
    var start = 1
    var end = lines.max()! 
    var res = 0
    
    while end >= start {
        let mid = (end + start) / 2
        let totCount = totalCount(length: mid)
        
        if target <= totCount {
            res = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return res
}


let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let K = input[0]
let N = input[1]

let lines = (0..<K).compactMap { _ in Int(readLine()!) }

print(binarySearch(target: N))

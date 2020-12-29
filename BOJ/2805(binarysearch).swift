// https://www.acmicpc.net/problem/2805
// 입력 받을 때 map 말고 compactMap 쓰자.

import Foundation

func totalHeight(cutHeight: Int) -> Int {
    return trees.reduce(0) { $0 + (($1 > cutHeight) ? $1 - cutHeight : 0) }
}

func binarySearch(target: Int) -> Int {
    var start = 1
    var end = trees.max()!
    var res = 0
    
    while end >= start {
        let mid = (end + start) / 2
        let totHeight = totalHeight(cutHeight: mid)
        
        if target <= totHeight {
            res = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return res
}


let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let M = input[1]

let trees = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

print(binarySearch(target: M))

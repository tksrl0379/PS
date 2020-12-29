// https://www.acmicpc.net/problem/2512

import Foundation

func totalBudget(budget: Int) -> Int {
    return budgets.reduce(0) { $0 + ($1 > budget ? budget : $1 )}
}

func binarySearch(target: Int) -> Int {
    var start = 1
    var end = budgets.max()!
    var res = 0
    
    while end >= start {
        let mid = (end + start) / 2
        let totBudget = totalBudget(budget: mid)
        
        if target >= totBudget {
            res = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return res
}


let N = Int(readLine()!)!
let budgets = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let M = Int(readLine()!)!

print(binarySearch(target: M))

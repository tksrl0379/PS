// https://www.acmicpc.net/problem/10773

import Foundation

let K = Int(readLine()!)!
var stack = [Int]()

(0..<K).forEach { _ in
    let input = Int(readLine()!)!
    
    if input == 0 {
        stack.removeLast()
    } else {
        stack.append(input)
    }
}

print(stack.reduce(0) { $0 + $1 })

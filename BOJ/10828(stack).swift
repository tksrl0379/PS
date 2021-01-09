// https://www.acmicpc.net/problem/10828

import Foundation

var stack = [Int]()

func order(input: String) {
    if input.count >= 4 && String(Array(input)[0..<4]) == "push" {
        let number = input.split(separator: " ").last!
        stack.append(Int(number)!)
        return
    }
    
    
    switch input {
    case "pop":
        if let number = stack.popLast() { print(number) }
        else { print("-1") }
    case "size":
        print(stack.count)
    case "empty":
        if stack.isEmpty { print("1") }
        else { print("0") }
    case "top":
        if let number = stack.last { print(number) }
        else { print("-1") }
    default:
        break
    }
}


let N = Int(readLine()!)!
(0..<N).forEach { _ in
    order(input: readLine()!)
}

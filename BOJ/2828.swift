// https://www.acmicpc.net/problem/2828

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let N = input[0], M = input[1]

let J = Int(readLine()!)!

var first = 1
var count = 0

(0..<J).forEach { _ in
    let applePos = Int(readLine()!)!
    
    let end = first + (M - 1)
    
    if (first...end) ~= applePos { return }
    
    if applePos > first {
        count += (applePos - end)
        first += (applePos - end)
    } else {
        count += (first - applePos)
        first -= (first - applePos)
    }
}

print(count)

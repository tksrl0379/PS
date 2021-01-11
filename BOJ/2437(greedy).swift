// https://www.acmicpc.net/problem/2437


let N = Int(readLine()!)!
let weights = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()

var sum = 0
var index = 0
while true {
    if index == N || sum + 2 <= weights[index] { break }
    
    sum += weights[index]
    index += 1
}
print(sum + 1)

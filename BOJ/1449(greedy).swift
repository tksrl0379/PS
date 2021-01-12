// https://www.acmicpc.net/problem/1449

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0], L = input[1]

let locations = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var count = 0
var coverage = 0
for location in locations where location > coverage {
    count += 1
    coverage = location + (L - 1)
}
print(count)

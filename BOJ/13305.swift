// https://www.acmicpc.net/problem/13305


let N = Int(readLine()!)!

let distances = readLine()!.split(separator: " ").compactMap {
    Int(String($0)) }
let cities = readLine()!.split(separator: " ").compactMap {
    Int(String($0)) }

var result = 0
var minCity = cities.first!
for (index, city) in cities.enumerated() {
    if index == 0 { continue }
    
    result += (minCity * distances[index - 1])

    if minCity > city { minCity = city }
}

print(result)

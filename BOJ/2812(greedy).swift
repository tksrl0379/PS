// https://www.acmicpc.net/problem/2812

let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let N = input[0], K = input[1]
let number = readLine()!.compactMap { Int(String($0)) }

var pickCount = N - K
var maxIndex = 0

for _ in 0..<(N - K) {
    
    var maxValue = Int.min
    
    for index in (maxIndex...(N - pickCount)) {
        if number[index] > maxValue {
            maxValue = number[index]
            maxIndex = index + 1
            
            if maxValue == 9 { break }
        }
    }
    pickCount -= 1
    print(maxValue, terminator: "")
}

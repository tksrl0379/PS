// https://www.acmicpc.net/problem/1051

func cal() -> Int {
    for length in (1...minLength).reversed() {
        let length = length - 1
        
        for y in (0..<(N-length)) {
            for x in (0..<(M-length)) {
                let set = Set([square[y][x], square[y][x + length], square[y + length][x], square[y + length][x + length]])
            
                if set.count == 1 {
                    return (length+1) * (length+1)
                }
            }
        }
    }
    return 1
}

let inputs = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let N = inputs[0]
let M = inputs[1]

let minLength = min(N, M)
var square = [[Character]]()
(0..<N).forEach { _ in
    square.append(Array(readLine()!))
}

print(cal())

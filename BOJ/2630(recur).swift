// https://www.acmicpc.net/problem/2630

let N = Int(readLine()!)!
var matrix = [[Int]]()
for _ in 0..<N {
    matrix.append(readLine()!.split(separator: " ").map { Int(String(($0)))! })
}
var blue = 0
var white = 0

func recur(x: Int, y: Int, num: Int) {
    let mid = num/2
    
    var sum = 0
    for i in y..<y+num {
        for j in x..<x+num {
            sum += matrix[i][j]
        }
    }
    if sum == num*num {
        blue += 1
        return
    } else if sum == 0 {
        white += 1
        return
    }
    
    recur(x: x, y: y, num: mid)
    recur(x: x, y: y+mid, num: mid)
    recur(x: x+mid, y: y, num: mid)
    recur(x: x+mid, y: y+mid, num: mid)
}

recur(x: 0, y: 0, num: N)
print(white)
print(blue)

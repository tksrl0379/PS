// https://www.acmicpc.net/problem/1744

func cal(ary: [Int]) {
    var index = 0
    while index < ary.count {
        if index + 1 < ary.count && ary[index] * ary[index + 1] > ary[index] {

            result += ary[index] * ary[index + 1]
            index += 2

        } else {
            result += ary[index]
            index += 1
        }
    }
}

let N = Int(readLine()!)!
var seq = [Int]()

(0..<N).forEach { _ in
    seq.append(Int(readLine()!)!)
}

let up = seq.filter { $0 > 0 }.sorted { abs($0) > abs($1) }
let down = seq.filter { $0 <= 0 }.sorted { abs($0) > abs($1) }

var result = 0

cal(ary: up)
cal(ary: down)

print(result)

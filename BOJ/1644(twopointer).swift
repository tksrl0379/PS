// https://www.acmicpc.net/problem/1644

let N = Int(readLine()!)!
var ary = Array(repeating: true, count: N+1)

for i in 2..<ary.count {
    if ary[i] == false { continue }
    for j in stride(from: i*2, to: N+1, by: i) {
        ary[j] = false
    }
}

var decimal = [Int]()
for i in 2..<ary.count where ary[i] {
    if i > N { break }
    decimal.append(i)
}

var sum = 0, cnt = 0
var l = 0, r = 0

while true {
    if sum >= N {
        sum -= decimal[l]
        l += 1
    } else if r == decimal.count {
        break
    } else {
        sum += decimal[r]
        r += 1
    }
    
    if sum == N { cnt += 1 }

}

print(cnt)

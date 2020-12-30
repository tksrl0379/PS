// https://www.acmicpc.net/problem/2531

import Foundation

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0] // 벨트에 놓인 접시의 수
let D = input[1] // 초밥의 가짓수
let K = input[2] // 연속해서 먹는 접시의 개수
let couponNumber = input[3] // 쿠폰번호

var seq = [Int](repeating: 0, count: N)
(0..<N).forEach {
    seq[$0] = Int(readLine()!)!
}

var sushis = [Int](repeating: 0, count: D + 1)
var maxCounts = 0
var counts = 0
(0..<K).forEach {
    if sushis[seq[$0]] == 0 {
        counts += 1
    }
    sushis[seq[$0]] += 1
}

maxCounts = (counts + (sushis[couponNumber] == 0 ? 1 : 0))

for start in (0..<N-1) {
    let willRemoved = seq[start]
    let willAdded = seq[(start + K) % N] // end
    
    sushis[willRemoved] -= 1
    if sushis[willRemoved] == 0 { counts -= 1 }
    if sushis[willAdded] == 0 { counts += 1 }
    sushis[willAdded] += 1
    
    maxCounts = max(maxCounts, counts + (sushis[couponNumber] == 0 ? 1 : 0))
}

print(maxCounts)

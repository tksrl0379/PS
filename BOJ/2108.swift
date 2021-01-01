// https://www.acmicpc.net/problem/2108


// 1차 정답: 딕셔너리 사용

import Foundation

let N = Int(readLine()!)!

var integers = [Int](repeating: 0, count: N)

(0..<N).forEach {
    integers[$0] = Int(readLine()!)!
}
integers.sort()

// 산술평균
let first = Int(round(Double(integers.reduce(0) { $0 + $1 }) / Double(N)))

// 중앙값
let second = integers[integers.count / 2]

// 최빈값
var repeats = [Int: Int]()

integers.forEach { integer in
    if let _ = repeats[integer] {
        repeats[integer]! += 1
    } else {
        repeats[integer] = 1
    }
}
var maxCounts = repeats.max { $0.value < $1.value }?.value
var third = 0
var maxRepeats = repeats.filter { $0.value == maxCounts }

if maxRepeats.count == 1 {
    third = maxRepeats.first!.key
} else {
    third = maxRepeats.sorted { $0.key < $1.key }[1].key
}

// 범위
let fourth = integers.last! - integers.first!

print(first)
print(second)
print(third)
print(fourth)




// 2차 정답: 배열 사용

import Foundation

let N = Int(readLine()!)!

var integers = [Int](repeating: 0, count: N)
(0..<N).forEach {
    integers[$0] = Int(readLine()!)!
}
integers.sort()

// 산술평균
let first = Int(round(Double(integers.reduce(0) { $0 + $1 }) / Double(N)))

// 중앙값
let second = integers[integers.count / 2]

// 최빈값
var counts = [Int](repeating: 0, count: 8001)

integers.forEach { integer in
    counts[integer + 4000] += 1
}
var maxCount = counts.max()!
var third = 0
var maxCounts = [Int]()

for index in (0..<8001) {
    if counts[index] == maxCount {
        maxCounts.append(index - 4000)
    }
}

third = maxCounts.count == 1 ? maxCounts[0] : maxCounts[1]

// 범위
let fourth = integers.last! - integers.first!

print(first)
print(second)
print(third)
print(fourth)

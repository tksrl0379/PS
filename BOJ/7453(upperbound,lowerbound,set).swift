// https://www.acmicpc.net/problem/7453

// n^4 가 나오지 않도록 우선 배열 ABCD 를 AB / CD 로 만들고 계산했다.
// 1. 처음에는 upper, lowerbound 를 이용하여 구해보았으나 계속 시간초과가 나와서
// 2. Set 으로 했는데도 계속 시간초과가 발생해서 파이썬으로 바꿔서 제출했더니 통과가 됐다.
// 아직 Swift 로 통과한 사례도 없고.. swift 로 푸는 것은 일단 보류..

// 1차 시도: upperBound, lowerBound 활용 
import Foundation

func upperBound(target: Int) -> Int {
    var start = 0
    var end = n*n-1
    var res = -1
    
    while end >= start {
        let mid = (end + start) / 2
        
        let cd = CD[mid]
        if cd <= target { // upper
            res = mid
            start = mid + 1
        } else if target < CD[mid] {
            end = mid - 1
        }
    }
    
    return res
}

func lowerBound(target: Int) -> Int {
    var start = 0
    var end = n*n-1
    var res = -1
    
    while end >= start {
        let mid = (end + start) / 2
        
        let cd = CD[mid]
        if target > cd {
            start = mid + 1
        } else if target <= CD[mid] { // lower
            res = mid
            end = mid - 1
        }
    }
    
    return res
}


let n = Int(readLine()!)!

var A = [Int](repeating: 0, count: n)
var B = [Int](repeating: 0, count: n)
var C = [Int](repeating: 0, count: n)
var D = [Int](repeating: 0, count: n)

(0..<n).forEach { index in
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    A[index] = input[0]
    B[index] = input[1]
    C[index] = input[2]
    D[index] = input[3]
}

var CD = [Int](repeating: 0, count: n*n)
var tmpCnt = 0
C.forEach { c in
    D.forEach { d in
        CD[tmpCnt] = c+d
        tmpCnt += 1
    }
}
CD.sort()

var counts = 0

var AB = [Int]()
A.forEach { a in
    B.forEach { b in
        let value = a + b
        let upper = upperBound(target: -value)
        let lower = lowerBound(target: -value)
        
        if upper == -1 || lower == -1 { return }
        counts += (upper - lower + 1)
    }
}

print(counts)



// 2차 시도: hash(Set) 활용

import Foundation

let n = Int(readLine()!)!

var A = [Int](repeating: 0, count: n)
var B = [Int](repeating: 0, count: n)
var C = [Int](repeating: 0, count: n)
var D = [Int](repeating: 0, count: n)

(0..<n).forEach { index in
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    A[index] = input[0]
    B[index] = input[1]
    C[index] = input[2]
    D[index] = input[3]
}

var AB = [Int: Int]()
A.forEach { a in
    B.forEach { b in
        if let value = AB[a+b] {
            AB.updateValue(value + 1, forKey: a+b)
        } else {
            AB[a+b] = 1
        }
    }
}

var CD = [Int: Int]()
C.forEach { c in
    D.forEach { d in
        if let value = CD[c+d] {
            CD.updateValue(value + 1, forKey: c+d)
        } else {
            CD[c+d] = 1
        }
    }
}

var counts = 0
AB.forEach { ab in
    if let cdValue = CD[-ab.key] {
        counts += (cdValue * ab.value)
    }
}

print(counts)

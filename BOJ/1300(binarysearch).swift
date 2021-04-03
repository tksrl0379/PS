// https://www.acmicpc.net/problem/1300


// 1. 메모리 초과

//let N = Int(readLine()!)!
//let k = Int(readLine()!)!
//
//var ary = [Int]()
//(1...N).forEach { i in
//    (1...N).forEach { j in
//        ary.append(i * j)
//    }
//}
//ary.sort()
//
//print(ary[k - 1])

// 2. 정답 (lower bound)

let N = Int(readLine()!)!
let k = Int(readLine()!)!

func binarySearch() -> Int {
    var left = 1
    var right = N * N
    var ans = 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if getIndex(of: mid) >= k {
            ans = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return ans
}

func getIndex(of number: Int) -> Int {
    var count = 0
    
    for i in 1...N {
        count += min(number / i, N)
    }
    
    return count
}

print(binarySearch())

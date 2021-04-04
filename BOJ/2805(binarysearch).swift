// https://www.acmicpc.net/problem/2805
// 1. 입력 받을 때 map 말고 compactMap 쓰자.
// 2. 이 문제의 경우 Int(String($0)) 으로 변환해야 시간초과가 안 뜸. 좀 이상한듯.

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let M = input[1]

let trees = readLine()!.split(separator: " ").compactMap { Int(String($0)) }


func cut(to height: Int) -> Int {
    trees.reduce(0) { $0 + max(0, ($1 - height)) }
}


func binarySearch() -> Int {
    var left = 0
    var right = trees.max()!
    var ans = 0
    
    while left <= right {
        let mid = (left + right)/2
        
        if cut(to: mid) >= M {
            left = mid + 1
            ans = mid
        } else {
            right = mid - 1
        }
    }
    
    return ans
}


print(binarySearch())

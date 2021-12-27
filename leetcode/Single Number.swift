// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/549/
// 1차 정답: 딕셔너리를 이용한 풀이

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        nums.forEach {
            dict[$0, default: 0] += 1
        }
        return dict.keys.first { dict[$0] == 1 }!
    }
}


// 2차 정답: XOR 비트연산자를 이용한 풀이

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}

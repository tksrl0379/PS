// https://leetcode.com/problems/maximum-subarray/

// 1차 시도: 실패
// O(n^2)

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        
        var answer = Int.min
        var total = 0
        for i in (0..<nums.count) {
            for j in (i..<nums.count) {
                total += nums[j]
                answer = max(total, answer)
            }
            total = 0
        }
        
        return answer
    }
}

// 2차 시도: DP
// 각각의 인덱스는 해당 시점에서 가장 큰 부분배열의 합을 의미함
// f[i] = max(f[i], f[i] + f[i-1])

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {

        var ary = nums
        
        for index in (1..<nums.count) {
            ary[index] = max(ary[index], ary[index] + ary[index - 1])
        }
        
        return ary.max()!
    }
}

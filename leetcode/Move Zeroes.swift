// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3157/

// 1차 정답

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var cnt = 0
        for i in 0..<nums.count where nums[i] != 0 {
            nums[cnt] = nums[i]
            cnt += 1
        }
        (cnt..<nums.count).forEach {
            nums[$0] = 0
        }
    }
} 


// 2차 정답: 더 깔끔하고 명확한 답

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var cnt = 0 // 현재 교체되어야 할 대상(0) 을 가리키는 인덱스
        for i in 0..<nums.count where nums[i] != 0 {
            nums.swapAt(i, cnt)
            cnt += 1
        }
    }
}

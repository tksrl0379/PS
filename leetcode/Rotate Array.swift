// https://leetcode.com/problems/rotate-array/

// 1차
// step 기준으로 앞/뒤 잘라서 순서 바꿔서 이어 붙이기

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let step = nums.count - k % nums.count // 0..<k
        let first = nums[..<step]
        let last = nums[step...]
        nums = Array(last) + Array(first)
    }
}

// 2차
// step 기준으로 앞/뒤 각각 reverse 후 전체 reverse
// cyclic rotation이라고 하는 듯: https://stackoverflow.com/questions/57999103/cyclic-rotation-of-array-explanation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let step = nums.count - k % nums.count
        nums[..<step].reverse()
        nums[step...].reverse()
        nums.reverse()
    }
}

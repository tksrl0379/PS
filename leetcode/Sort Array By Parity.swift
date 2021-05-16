// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3260/

class Solution {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var nums = nums
        var evenCnt = 0
        for i in 0..<nums.count where nums[i] % 2 == 0{
            nums.swapAt(evenCnt, i)
            evenCnt += 1
        }
        return nums
    }
}

// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/578/

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        Set(nums).count != nums.count
    }
}

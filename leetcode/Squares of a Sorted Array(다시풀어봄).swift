// https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3574/

class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var left = 0
        var right = nums.count - 1
        var res: [Int] = []
        
        while left <= right {
            if abs(nums[left]) > abs(nums[right]) {
                res.append(nums[left] * nums[left])
                left += 1
            } else {
                res.append(nums[right] * nums[right])
                right -= 1
            }
        }
        
        return res.reversed()
    }
}

// https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3231/

class Solution {
    func thirdMax(_ nums: [Int]) -> Int {
        guard Set(nums).count >= 3 else {
            return nums.max()!
        }
        
        var nums: [Int] = []
        var maxNum: Int = 0
        (0..<2).forEach { _ in
            maxNum = nums.max()!
            nums = nums.filter { $0 != maxNum }
        }
        return nums.filter { $0 != maxNum }.max()!
    }
}

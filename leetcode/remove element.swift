// https://leetcode.com/explore/learn/card/fun-with-arrays/526/deleting-items-from-an-array/3247/

// 1차 정답(8ms)
class Solution {
   func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
       nums = nums.filter { $0 != val }
       return nums.count
   }
}

// 2차 정답(8ms)
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var cnt = 0
        
        for i in 0 ..< nums.count where nums[i] != val {
            nums[cnt] = nums[i]
            cnt += 1
        }
        
        return cnt
    }
}

// 3차 정답(4ms)
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        
        while end >= start {
            if nums[start] == val {
                nums.swapAt(start, end)
                end -= 1
            } else {
                start += 1
            }
        }
        return start
    }
}

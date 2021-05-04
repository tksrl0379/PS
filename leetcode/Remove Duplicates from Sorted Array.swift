// https://leetcode.com/explore/learn/card/fun-with-arrays/526/deleting-items-from-an-array/3248/

// 1차 정답
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard var recent = nums.first else {
            return 0
        }
        var cnt = 1
        
        for i in 1..<nums.count where nums[i] != recent {
            nums[cnt] = nums[i]
            recent = nums[i]
            cnt += 1
        }
        return cnt
    }
}


// 2차 정답: 필요 없는 변수 제거
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 { return nums.count }
        var cnt = 0
        
        for i in 1..<nums.count where nums[i] != nums[cnt] {
            cnt += 1
            nums[cnt] = nums[i]
        }
        return cnt + 1
    }
}

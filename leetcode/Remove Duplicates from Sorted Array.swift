// https://leetcode.com/explore/learn/card/fun-with-arrays/526/deleting-items-from-an-array/3248/

// 1차 정답
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var set = Set<Int>()
        var index = 0
        for i in (0..<nums.count) where !set.contains(nums[i]) {
            set.insert(nums[i])
            nums[index] = nums[i]
            index += 1
        }

        return index
    }
}

// 2차 정답
// 현재의 index 앞에 있는 값들은 이미 검증이 끝났으므로 굳이 이전 값들을 모두 포함하는 Set을 사용할 필요가 없음. 가장 최근 index만 비교하면 됨
// 문제 풀다 보면 이런거 놓치는 경우가 많은데 항상 염두에 둬야 할 듯.

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        var index = 0
        for i in (1..<nums.count) where nums[index] != nums[i] {
            index += 1
            nums[index] = nums[i]
        }
        
        return index + 1
    }
}

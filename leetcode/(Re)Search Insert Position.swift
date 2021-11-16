// https://leetcode.com/problems/search-insert-position/

// 1차 정답

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var targetIndex = 0
        
        for (index, num) in nums.enumerated() {
            if num < target {
                targetIndex = index + 1
            } else if num == target {
                return index
            }
        }
        
        return targetIndex
    }
}

// 2차 정답: 정렬된 상태로 주어지기 때문에 이진탐색을 적용할 수 있다.
// 다만, 정석적인 이분탐색 혹은 상계/하계문제랑 살짝 다르게 풀어야 한다. (https://blog.naver.com/tksrl0379/222095978067)

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        var start = 0
        var end = nums.count // -1 X
        
        while end > start { // >= X
            let mid = (start + end)/2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                start = mid + 1
            } else {
                end = mid // -1 X
            }
        }
        
        return end
    }
}

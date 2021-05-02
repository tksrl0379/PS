// https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3240/

// 1차
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        map { $0 * $0 }.sorted { $0 < $1 }
    }
}



// 2차 (투포인터)
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var N = nums.count
        var start = 0
        var end = N - 1
        var answer = [Int](repeating: 0, count: N)
        
        var index = N - 1
        while end >= start {
            let absStart = nums[start] * nums[start]
            let absEnd = nums[end] * nums[end]
            
            if absStart > absEnd {
                answer[index] = absStart
                start += 1
            } else {
                answer[index] = absEnd
                end -= 1
            }
            index -= 1
        }
        
        return answer
    }
}

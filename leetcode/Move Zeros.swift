// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/567/

// 1차 정답: 새 배열을 만들어서 푸는 쉬운 풀이

class Solution {
   func moveZeroes(_ nums: inout [Int]) {

       nums = nums.filter { $0 != 0 } + nums.filter { $0 == 0 }
   }
}

// 2차 정답: 새 배열 생성 없이 In-Place로 풀이
// 딱 num의 count만큼만에 풀 수 있음
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var zeroIndex = 0
        var nonZeroIndex = 1
        
        while nonZeroIndex < nums.count {
            
            if nums[zeroIndex] != 0 { // zeroIndex가 zero를 찾을 때까지 += 1
                zeroIndex += 1
            } else if nums[nonZeroIndex] != 0 { // nonZeroIndex가 non-zero를 찾으면 Swap
                let tmp = nums[nonZeroIndex]
                nums[nonZeroIndex] = nums[zeroIndex]
                nums[zeroIndex] = tmp
                
                zeroIndex += 1
            }
            
            nonZeroIndex += 1
        }
    }
}


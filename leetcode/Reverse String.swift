// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/879/

// 1차 정답: 반복문
class Solution {
    func reverseString(_ s: inout [Character]) {
        var start = 0
        var end = s.count - 1

        while start < end {
            s.swapAt(start, end)

            start += 1
            end -= 1
        }
    }
}


// 2차 정답: 재귀

class Solution {
    func reverseString(_ s: inout [Character]) {
        recursiveReverse(&s, start: 0, end: s.count - 1)
    }
    
    func recursiveReverse(_ s: inout [Character], start: Int, end: Int) {
        guard start < end else {
            return
        }
        
        s.swapAt(start, end)
        recursiveReverse(&s, start: start + 1, end: end - 1)
    }
}

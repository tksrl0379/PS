// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/881/

// 1차

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dic = [Character: Int]()
        
        for (idx, c) in s.enumerated() {
            if dic[c] == nil && dic[c] != -1 {
                dic[c] = idx
            } else {
                dic[c] = -1
            }
        }
        
        return dic.values.filter { $0 >= 0 }.min() ?? -1
    }
}

// 2차
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var dic = [Character: Int]()
        
        for (idx, c) in s.enumerated() {
            dic[c, default: 0] += 1
        }
        
        for (idx, c) in s.enumerated() {
            if dic[c]! == 1 {
                return idx
            }
        }
        
        return -1
    }
}

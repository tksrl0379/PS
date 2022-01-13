// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/882/

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var countDic = [Character: Int]()
        
        s.forEach { c in
            countDic[c, default: 0] += 1
        }
        
        t.forEach { c in
            countDic[c, default: 0] -= 1
        }
        
        return countDic.values.first { $0 != 0 } == nil
    }
}

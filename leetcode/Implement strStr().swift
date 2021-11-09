// https://leetcode.com/problems/implement-strstr/

// 1차 정답
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle == "" { return 0 }
        
        var hIndex = 0
        var nIndex = 0
        let haystack = Array(haystack)
        let needle = Array(needle)
        let needleCount = needle.count
        var answer = 0
        
        
        while hIndex < haystack.count {
            if haystack[hIndex] == needle[nIndex] {
                
                if needleCount - 1 == nIndex {
                    return answer
                }
                
                hIndex += 1
                nIndex += 1
            } else if nIndex != 0 { // 실패. 다시 시작
                hIndex = answer + 1
                nIndex = 0
                answer = hIndex
            } else {
                hIndex += 1
                nIndex = 0
                answer = hIndex
            }
        }
        
        return -1
    }
}

// 2차 정답: String.index를 매번 만드는 것보단, var로 선언하고 index(after:)를 사용하는게 말도 안되게 훨씬 빠르다.
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return 0 }
        if needle.count > haystack.count { return -1 }
        
        var startIndex = haystack.index(haystack.startIndex, offsetBy: 0)
        var endIndex = haystack.index(haystack.startIndex, offsetBy: needle.count - 1)
        var index = 0
        
        while endIndex < haystack.endIndex {
            
            let subStr = haystack[startIndex...endIndex]
            
            if subStr == needle {
                return index
            }
            
            startIndex = haystack.index(after: startIndex)
            endIndex = haystack.index(after: endIndex)
            index += 1
        }
        
        return -1
    }
}

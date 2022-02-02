// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/883/


// 1차 정답

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let result = s.lowercased().filter { $0.isAlphaNumeric }
        return result == result.reversed()
    }
}

extension Character {

    var isAlphaNumeric: Bool {
        CharacterSet.alphanumerics.contains(self.unicodeScalars.first!)
    }
}

// 2차 정답
// 1차 정답이 시간이 좀 더 걸리는 듯 하여 앞에 있는 최적의 답들을 참고했다.
// 투포인터로 풀어져 있어서 따라했는데 시간은 비슷하고.. 보아하니 투포인터가 문제가 아니라 isLetter를 사용한 것에서 큰 차이가 오는 것 같다.
// 다만, isLetter의 경우 영어를 제외한 다른 문자의 경우에도 true를 뱉어버려서 분명한 오답이긴 하다. 아마 영미권 사이트라 다른 언어에 대한 테스트 케이스가 없는듯하다.

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
        let s = Array(s)
        var l = 0
        var r = s.count - 1
        
        while l < r {
            if s[l].isAlphaNumeric == false {
                l += 1
            } else if s[r].isAlphaNumeric == false {
                r -= 1
            } else if s[l].lowercased() == s[r].lowercased() {
                l += 1
                r -= 1
            } else {
                return false
            }
        }
        
        return true
    }
}

extension Character {

    var isAlphaNumeric: Bool {
        CharacterSet.alphanumerics.contains(self.unicodeScalars.first!)
    }
}


// 3차 정답
// 정규표현식 풀이
// [^ab]는 a및 b를 제외한 문자를 뜻하므로.. 아래의 경우 alphanumeric을 제외한 나머지 문자들을 모두 없앤다. 
// 정규표현식: https://hamait.tistory.com/342

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let pattern = "[^A-Za-z0-9]+"
        let result = s.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
        return result == String(result.reversed())
    }
}

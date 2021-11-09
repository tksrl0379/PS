// https://leetcode.com/problems/valid-parentheses/

class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count == 1 { return false }
        
        let dict = ["}": "{", ")": "(", "]": "["]
        var leftBracketStack = [String]()
        
        for chr in s {
            let chr = String(chr)
            
            if let leftBracket = dict[chr] {
                if leftBracket != leftBracketStack.popLast() {
                    return false
                }
            } else {
                leftBracketStack.append(chr)
            }
        }
        
        return leftBracketStack.isEmpty
    }
}

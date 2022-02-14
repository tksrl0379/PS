// https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/884/


class Solution {
    
    func myAtoi(_ s: String) -> Int {
        var plus: Bool = true
        var s = s.trimmingCharacters(in: .whitespaces)
        
        if let c = s.first {
            if c == "-" {
                plus = false
                s.removeFirst()
            } else if c == "+" {
                s.removeFirst()
            }
        }
        
        return {
            let prefixed = Int(String(s.prefix { $0.isNumber })) ?? 0
            let signed = plus ? prefixed : -prefixed
            let clamped = min(Int(Int32.max), max(Int(Int32.min), signed))
            return Int(clamped)
        }()
    }
}

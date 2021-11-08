// 1차 정답

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        let strs = strs.map { Array($0) }
        
        var index = 0
        var answer = ""
        while true {
            guard index < strs[0].count else {
                return answer
            }
            
            let chr = strs[0][index]
            
            for str in strs {
                guard index < str.count else {
                    return answer
                }
                
                if str[index] != chr {
                    return answer
                }
            }
            
            answer += String(chr)
            index += 1
        }
    }
}

// 2차 정답

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        
        var minStr = strs.min { $0.count < $1.count }!
        
        for str in strs {
            while !str.hasPrefix(minStr) {
                minStr.removeLast()
            }
        }
        
        return minStr
    }
}

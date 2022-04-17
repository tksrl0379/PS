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
// hasPrefix
// 테스트 케이스중에 0이 있으면 isEmpty 체크 필요
// 다른 풀이들은 string 비교 시 index범위 체크해줘야하는데, 이건 애초에 가장 짧은 길이를 가진 문자열을 선정했기 때문에 불필요해져서 로직이 간소화됨.

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        
        var minStr = strs.min { $0.count < $1.count }!
        
        for str in strs {
            while !str.hasPrefix(minStr) {
                minStr.removeLast()
            }
        }
        
        return minStr
    }
}

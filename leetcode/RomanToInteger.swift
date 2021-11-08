// https://leetcode.com/problems/roman-to-integer/

// 1차 정답

class Solution {
    func romanToInt(_ s: String) -> Int {
        let roman = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let combi = ["I": "VX", "X": "LC", "C": "DM"]
        
        var str = Array(s)
        var index = 0
        var result = 0
        while s.count > index {
            let current = String(str[index])
            let number = roman[current] ?? 0
            
            
            if let value = combi[current], index + 1 < s.count {
                if value.contains(str[index + 1]) {
                    let key = String(str[index + 1])
                    let secondNumber = roman[key] ?? 0
                    result += (secondNumber - number)
                    
                    index += 2
                    result *= 10
                    continue
                }
            }
            
            result += number
            
            index += 1
            
        }
        
        return result
    }
}

// 2차 정답 풀진 않았는데, let dict = ["I": 1, "V": 5, "IV": 4, "X": 10, "IX": 9, "L": 50, "XL": 40, "C": 100, "XC": 90, "D": 500, "CD": 400, "M": 1000, "CM": 900]
// 로마 숫자가 한정되있으니 이런 식으로 그냥 딕셔너리에 일일이 명시해주는 방법이 좀 더 나은거 같음.

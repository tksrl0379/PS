// https://leetcode.com/problems/reverse-integer/submissions/
// 이런 정수형의 범위를 다루는 문제는 일반적으로 문자열로 풀었는데,
// 변환하지 않고 그대로 푸는 방법도 있어서 해봤다.
// 효율은 아주 조금 더 좋은 것 같긴 한데, 효율성에서 큰 차이가 없다면 실제론 1차 방법을 사용할 것 같다.

// 하나 발견한 신기한건, Int32(숫자) 에 범위를 -2^32/2 ~ 2^32/2 - 1 를 초과하는 숫자가 런타임에 들어가게 되면 범위 초과에 관한 에러가 발생하는데 
// Int32(String(숫자))와 같이 넣게 되면 런타임 에러가 안 뜨고 알아서 nil로 바꿔준다.


// 1차: 문자열

class Solution {
    func reverse(_ x: Int) -> Int {
        var x = x
        var flag = false
        if x < 0 {
            x *= -1
            flag = true
        }
        
        let str = String(String(x).reversed())
        let res = Int32(str) ?? 0
        return flag ? -Int(res) : Int(res)
    }
}

// 2차: 변환 없이 정수형 그대로.
class Solution {
    func reverse(_ x: Int) -> Int {
        var answer = 0
        
        var value = x
        if x < 0 {
            value *= -1
        }
        
        while value > 0 {
            let suffix = value % 10
            answer = (answer + suffix) * 10
            
            value /= 10
        }
        answer /= 10
        
        if x < 0 {
            answer *= -1
        }
        
        guard -pow(2, 32)/2...(pow(2, 32)/2 - 1) ~= Decimal(answer) else {
            return 0
        }
        
        return answer
    }
}

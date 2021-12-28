// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/559/
// 이런 식으로 정수 계산을 요구하는 문제들은 보통 Int에서 허용하는 값 범위를 초과하는 식으로 인풋을 준다.
// 따라서 문자열이나 배열로 구현해야 한다.

// 1차 정답
// 러프하게 딱 문제에 맞게 푼 답안

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits

        var carry = 1
        (0..<digits.count).reversed().forEach {
            digits[$0] += carry
            carry = 0

            if digits[$0] == 10 {
                digits[$0] = 0
                carry = 1
            }
        }

        if carry == 1 {
            digits = [1] + digits
        }

        return digits
    }
}


// 2차 정답
// 좀 더 가독성 있고 다양한 상황에 대응 가능한 코드

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        
        var carry = 1
        (0..<digits.count).reversed().forEach {
            let sum = digits[$0] + carry
            digits[$0] = sum % 10
            carry = sum / 10
        }
        
        if carry != 0 {
            digits = [carry] + digits
        }
        
        return digits
    }
}

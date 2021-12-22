// https://leetcode.com/problems/add-binary/
// Int( ,radix: 2) , String( , radix: 2) 로 Int, String 간 변환이 가능하긴 한데 해당 문제의 input 범위가 Int형을 초과해서 이 방법은 의미가 없음

// 1차 정답
// 문자열 > 숫자 변환 > 문자열
// 다소 비효율적이고 코드가 더러움
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        let a = Array(a.reversed())
        let b = Array(b.reversed())
        let aCount = a.count
        let bCount = b.count
        let length = max(aCount, bCount)
        
        var carry: Int = 0
        return (0...length).reduce("") {
            if $1 == length && carry == 0 { // 마지막 연산 예외처리
                return $0
            }
          
            var result: Int = 0
            if (0..<aCount) ~= $1 {
                result += Int(String(a[$1]))!
            }
            if (0..<bCount) ~= $1 {
                result += Int(String(b[$1]))!
            }
            
            result += carry
            
            if result >= 2 {
                carry = 1
                result -= 2
            } else {
                carry = 0
            }
            return String(result) + $0
        }
    }
}

// 2차 정답
// 문자열로 바로 풀기
// 불필요한 변환도 없고 가독성도 더 좋음

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        var a = a
        var b = b
        
        var carry = 0
        var result = ""
        
        while !a.isEmpty || !b.isEmpty {
            let aCharacter = a.popLast()
            let bCharacter = b.popLast()
            
            if aCharacter == "1" {
                carry += 1
            }
            
            if bCharacter == "1" {
                carry += 1
            }
            
            result = String(carry % 2) + result
            carry /= 2
        }
        
        if carry == 1 {
            result = "1" + result
        }
        
        return result
    }
}

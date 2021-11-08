// 1차: 문자열

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let string = String(x)
        let reversed = String(string.reversed())
        
        return string == reversed
    }
}

// 2차: 정수형


class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var reverse = 0
        var number = x
        while number > 0 {
            reverse *= 10
            reverse += number % 10
            number /= 10
        }
        return reverse == x
    }
}


        

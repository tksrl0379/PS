// https://leetcode.com/explore/challenge/card/september-leetcoding-challenge-2021/637/week-2-september-8th-september-14th/3973/

// 1차: 비효율 + 예외 케이스로 인해 난잡 

class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var dic: [Character: Int] = [:]

        text.forEach {
            guard "balloon".contains($0) else {
                return
            }
            dic[$0, default: 0] += 1
        }

        if dic["l"] != nil {
            dic["l"]! /= 2
        }
        if dic["o"] != nil {
            dic["o"]! /= 2
        }

        if dic.keys.count != 5 {
            return 0
        }

        let val = dic.min { $0.value < $1.value }

        return val?.value ?? 0
    }
}


// 2차: 효율 및 가독성 개선

class Solution {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var dic: [Character: Int] = [:]
        text.forEach {
            dic[$0, default: 0] += 1
        }
        
        var result: [Character : Int] = [:]
        for chr in Set("balloon") {
            guard dic[chr] != nil else {
                return 0
            }
            if chr == "l" || chr == "o" {
                result[chr] = dic[chr]! / 2
            } else {
                result[chr] = dic[chr]!
            }
        }
        
        return result.min { $0.value < $1.value }?.value ?? 0
    }
}

// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/564/


// 1차 정답

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = prices.first!
    
        return prices[1...].reduce(0) { total, price in
            defer { buy = price }
            
            if buy < price {
                return total + (price - buy)
            }
            return total
        }
    }
}


// 2차 정답
// 1차 정답으로 풀고나니, 그냥 바로 앞뒤 비교해서 뒤에 나온 값이 더 크면 계산해주면 끝나는 문제임을 뒤늦게 깨달았다. -_-;

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        (1..<prices.count).reduce(0) { result, index in
            if prices[index - 1] < prices[index] {
                return result + (prices[index] - prices[index - 1])
            }
            return result
        }
    }
}

// https://www.acmicpc.net/problem/15988

// DP

// 점화식 과정
// 1: 1
// 2: 1+1, 2
// 3: 1+1+1, 1+2, 2+1, 3
// 여기서 4를 만들려면 1에는 +3, 2에는 +2, 3에는 +1을 각각해주면 됨.
// 즉 dp[N] = dp[N - 1] + dp[N - 2] + dp[N - 3]

// 중복 계산을 방지하고자 인풋 중 가장 큰 값을 골라 안풋 개수와 무관하게 dp는 한 번만 계산하도록 구현

let T = Int(readLine()!)!
let inputs: [Int] = (0..<T).reduce([]) { res, _ in
    res + [Int(readLine()!)!]
}

let maxInput = inputs.max()!
var dp = Array(repeating: 0, count: 1000000 + 1)

dp[1] = 1
dp[2] = 2
dp[3] = 4

if maxInput < 4 {
    inputs.forEach {
        print(dp[$0])
    }
} else {
    for i in (4...maxInput) {
        dp[i] = (dp[i - 1] + dp[i - 2] + dp[i - 3]) % 1000000009
    }
    
    inputs.forEach {
        print(dp[$0])
    }
}

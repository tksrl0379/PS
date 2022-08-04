// https://www.acmicpc.net/problem/2225

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0]
let K = input[1]

var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: N + 1), count: K + 1)

(0...N).forEach {
    dp[0][$0] = 0
    dp[1][$0] = 1
}

(1...K).forEach { i in
    (0...N).forEach { j in
        (0...j).forEach { l in
            dp[i][j] = (dp[i][j] + dp[i - 1][l]) % 1000000000
        }
    }
}

print(dp[K][N] % 1000000000)

// 0~N의 숫자 중 K개를 이용하여 N을 만들 수 있는 경우의 수를 구해야 함
// 점화식 구하는 법
// X + X + L = N (K=3) 은, X + X = N - L (K=2) 로 표현 가능
// dp[3][N] = dp[2][N - L] (0 <= L <= N) 로 정리할 수 있음
//   * ex. dp[3][j] = dp[2][j] + ... + dp[2][0]
// dp[K][N] = dp[K - 1][N - 0] + dp[K - 1][N - 1] + dp[K - 1][N - 2] + dp[K - 1][N - 3] + ... + dp[K - 1][N - N]


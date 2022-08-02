// https://www.acmicpc.net/problem/11727

let N = Int(readLine()!)!

if N == 1 {
    print(1)
} else {
    var dp: [Int] = Array(repeating: 0, count: N)
    
    dp[0] = 1
    dp[1] = 3
    for i in (2..<N) {
        dp[i] = (dp[i - 1] + dp[i - 2] * 2) % 10007
    }
    print(dp[N - 1])
}

// - DP는 점화식부터 찾기
//   * 경우의 수를 나열해서 규칙 찾아보기
//   * 위 문제의 경우 (2x1) or (2x2) or (1x2)를 조합할 수 있는 것이 힌트가 됨 (가로 너비가 1,2 임)
//   * 예를들어.
//   * 2x4를 만들 수 있는 방법은 2x3에 가로 너비가 1인 타일을 붙이거나 or 2x2에 가로 너비가 2인 타일을 붙이는 것.
//   * 근데 가로 너비가 2인 타일은 (2x2), (1x2)로 2개임
//   * 따라서 (2xN)의 경우의 수 = (2 x (N-1)의 경우의 수 * 1개) + (2 x (N-2)의 경우의 수 * 2개) 가 됨.

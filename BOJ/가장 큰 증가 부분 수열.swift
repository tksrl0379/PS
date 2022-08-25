// https://www.acmicpc.net/problem/11055

let N = Int(readLine()!)
let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }

var dp = inputs

for i in (1..<inputs.count) {
    
    var maxNum = 0
    for j in (0..<i).reversed() {
        if inputs[i] > inputs[j] {
            maxNum = max(dp[j], maxNum)
        }
    }
    dp[i] += maxNum
    
}
print(dp.max()!)

// 매 순간 자기(i)보다 낮은 인덱스들(0..<i)에 있는 element를 빼내서 자신(i)의 element와 비교 > 자신이 더 큰 경우 증가한다는 의미이므로 maxNum으로 기록 > 가장 큰 maxNum를 구해서 dp에 더해준다.

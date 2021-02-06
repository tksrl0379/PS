// https://www.acmicpc.net/problem/14916

let n = Int(readLine()!)!

let f = n/5
var answer = -1


for i in (0...f).reversed() {
    
    let left = n - (5 * i) // 5 배수 제하고 남은 수
    
    if Double(left / 2) == Double(left) / 2.0 {
        answer = i + left / 2
        
        break
    }
}

print(answer)

// https://www.acmicpc.net/problem/1052


func cal(_ answer: Int) -> Int {
    
    var value = answer
    var count = 0
    while value != 0 {
        if value % 2 == 1 { count += 1 }
        value /= 2
    }
    
    return count
}


let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let N = input[0]
let K = input[1]

var answer = N
while true {
    
    if cal(answer) <= K { break } // 합쳐지는 병의 개수가 K개 이하면 정답
    answer += 1
}

print(answer - N)

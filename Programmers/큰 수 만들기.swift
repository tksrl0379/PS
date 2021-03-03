// 1차 풀이
func solution(_ number:String, _ k:Int) -> String {
    let number = number.map { Int(String($0))! }
    var cnt = k
    var start = 0
    var answer: [Int] = []

    for _ in 0..<number.count-k {
        var maxValue = Int.min
        var maxIndex = start

        for j in start..<(cnt + 1) {
            if maxValue < number[j] {
                maxValue = number[j]
                maxIndex = j

                if maxValue == 9 { break }
            }
        }

        start = maxIndex + 1
        cnt += 1 // 범위를 1 늘려줌
        answer.append(number[maxIndex])
    }

    return answer.reduce("") { $0 + String($1) }
}

// 2차 풀이
func solution(_ number: String, _ k: Int) -> String {
    var k = k
    let number = number.map { Int(String($0))! }
    var answer = [Int]()
    
    for n in number {
        
        while !answer.isEmpty && answer.last! < n && k > 0 {
            answer.removeLast()
            k -= 1
        }
        
        answer.append(n)
    }
    if k > 0 { answer = Array(answer[0..<answer.count-k]) }
    return answer.reduce("") { $0 + String($1) }
}

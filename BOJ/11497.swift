// https://www.acmicpc.net/problem/11497

// 1차 정답

let T = Int(readLine()!)!

(0..<T).forEach { _ in
    let N = Int(readLine()!)!
    let inputAry = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()
    
    var ary = [Int](repeating: 0, count: N)
    
    var start = 0
    var end = N-1
    var index = 0
    
    while end >= start {
        if ary[start] == 0 {
            ary[start] = inputAry[index]
            index += 1
            start += 1
        }
        
        if ary[end] == 0 {
            ary[end] = inputAry[index]
            index += 1
            end -= 1
        }
    }
    
    // 최대 차이 구하기
    var maxVal = Int.min
    for i in (0..<N) {
        let dif = abs(ary[i] - ary[(i + 1) % N])
        maxVal = max(maxVal, dif)
    }
    print(maxVal)
}


// 2차 정답

let T = Int(readLine()!)!

(0..<T).forEach { _ in
    let N = Int(readLine()!)!
    let inputAry = readLine()!.split(separator: " ").compactMap { Int(String($0)) }.sorted()
    
    var maxVal = Int.min
    for i in (2..<N) {
        let dif = abs(inputAry[i - 2] - inputAry[i])
        maxVal = max(maxVal, dif)
    }
    print(maxVal)
}

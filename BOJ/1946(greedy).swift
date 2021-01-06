// https://www.acmicpc.net/problem/1946
// 무슨 이유인지는 모르겠지만 이 문제의 경우 Swift 는 무조건 입력을 https://gist.github.com/kbw2204/3263909f5abbdb8d12e251e742a6b720 에 있는 것을 활용해서 받아야 함
// 로직 자체는 아래와 동일

let T = Int(readLine()!)!
(0..<T).forEach { _ in
    let number = Int(readLine()!)!
    var candidates = [[Int]](repeating: [Int](), count: number)
    
    (0..<number).forEach {
        let candidate = readLine()!.split(separator: " ").map { Int($0)! }
        candidates[$0] = candidate
    }
    candidates.sort { $0[0] < $1[0] }
    
    var count = 1
    var minRank = candidates[0][1]
    
    for index in 1..<number {
        let rank = candidates[index][1]
        
        if minRank > rank {
            count += 1
            minRank = rank
        }
    }
    print(count)
}

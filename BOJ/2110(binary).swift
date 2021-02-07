// https://www.acmicpc.net/problem/2110

let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let N = input[0]
let C = input[1]
var data = [Int]()
(0..<N).forEach { _ in data.append(Int(readLine()!)!)}
data = data.sorted()

func binarySearch(data: [Int], key: Int) -> Int {
    
    var answer = 0
    
    var start = 1
    var end = data.last! - data.first!
    
    while end >= start {
        var cnt = 1
        let mid = (start + end) / 2
        
        var cur = data.first!
        for i in 1..<data.count {
            if data[i] - cur >= mid {
                cur = data[i]
                cnt += 1
            }
        }

        if cnt < key { // key 보다 적으므로 mid 는 볼 필요가 없음
            end = mid - 1
        } else {
            answer = mid
            start = mid + 1 // 이미 최소 key보다는 높은 상태이므로 mid 를 볼 필요가 없음
        }
        
    }
    return answer
}

print(binarySearch(data: data, key: C))
[출처] [Swift] 공유기 설치|작성자 재밌게


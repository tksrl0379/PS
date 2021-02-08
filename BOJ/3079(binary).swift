// https://www.acmicpc.net/problem/3079
// 코드는 프로그래머스 버전

func cal(times: [Int], time: Int) -> Int {
    times.reduce(0) { $0 + time/$1 }
}

func binarySearch(times: [Int], key: Int) -> Int {
    // start, mid, end 는 모두 '시간' 이다.
    var start = 0 
    var end = 1000000000 * key
    
    while start < end {
        let mid = (start+end)/2
        
        let time = cal(times: times, time: mid)
        
        if time < key {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return end
}

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    return Int64(binarySearch(times: times, key: n))
}

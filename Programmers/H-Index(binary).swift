func solution(_ citations:[Int]) -> Int {
    
    let citations = citations.sorted { $0 > $1 }
    
    var start = 0
    var end = citations.max()!
    var ans = 0
    
    while end >= start {
        let mid = (end + start) / 2
        
        let cnt = citations.filter { $0 >= mid }.count // mid 개 이상의 인용횟수를 가지는 논문 개수 구하기 
        
        if mid > cnt { // 인용횟수가 논문 개수보다 큰 경우 -> 인용 횟수를 줄여줘야 함
            end = mid - 1
        } else { // 인용 횟수가 논문 개수와 같거나 더 작은 경우(조건만족) -> 최대 인용횟수를 구하는 문제이므로 인용횟수를 늘려서 조건을 만족하는지 테스트 해봄
            ans = mid
            start = mid + 1
        }
    }
    
    return ans
}

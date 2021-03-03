var parent = [Int]()

func getParent(_ x: Int) -> Int {
    if parent[x] == x { return x }
    else { return getParent(parent[x]) }
}

func unionParent(_ a: Int, _ b: Int) {
    let a = getParent(a)
    let b = getParent(b)
    if a > b { parent[a] = b }
    else { parent[b] = a }
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    parent = (0..<n).map { $0 } // 사이클 테이블
    let costs = costs.sorted { $0[2] < $1[2] } // 가중치 기준 정렬
    
    var answer = 0
    
    for cost in costs {
        if getParent(cost[0]) == getParent(cost[1]) { continue } // 부모가 같음, 즉 같은 그래프인 경우
        
        unionParent(cost[0], cost[1])
        answer += cost[2]
    }
    
    return answer
}

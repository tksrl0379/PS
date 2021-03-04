// 1차 풀이(테스트케이스 1번 시간초과)
var ary = [Int]()
var cnt = 0

func dfs(_ depth: Int, _ start: Int, _ end: Int, _ res: Int) {
    if depth == end {
        cnt += res
        return
    }

    for i in start..<ary.count {
        dfs(depth + 1, i + 1, end, res * ary[i])
    }
}

func solution(_ clothes:[[String]]) -> Int {
    var dic = [String: Int]()

    clothes.forEach {
        dic[$0[1]] = (dic[$0[1]] ?? 0) + 1
    }

    ary = dic.map { $0.value }

    (1...dic.count).forEach {
        dfs(0, 0, $0, 1)
    }


    return cnt
}


// 2차 풀이
func solution(_ clothes:[[String]]) -> Int {
    var dic = [String: Int]()
    
    clothes.forEach {
        dic[$0[1]] = (dic[$0[1]] ?? 0) + 1
    }
    
    let ary = dic.map { $0.value + 1 }

    
    return ary.reduce(1) { $0 * $1 } - 1
}

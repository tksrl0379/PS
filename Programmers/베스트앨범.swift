func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dic = [String: [(cnt: Int, number: Int)]]()
    
    (0..<genres.count).forEach {
        dic[genres[$0], default: []].append((plays[$0], $0))
    }
    
    let ary = Array(dic.values).sorted {
        $0.reduce(0) { $0 + $1.cnt } > $1.reduce(0) { $0 + $1.cnt }
    }
    
    return ary.flatMap {
        $0.sorted { // 1. 재생 횟수 기준 높은 순 -> 같을 시 2. 고유 번호 낮은 순으로 정렬
            if $0.cnt == $1.cnt { return $0.number < $1.number
            } else { return $0.cnt > $1.cnt }
        }
        .map { $0.number }
        .prefix(2)
    }
}

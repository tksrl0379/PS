// func solution(_ n:Int, _ edge:[[Int]]) -> Int {
//     var matrix = [[Double]](repeating: [Double](repeating: Double.infinity, count: n + 1), count: n + 1)
//     edge.forEach {
//         matrix[$0[0]][$0[1]] = 1
//         matrix[$0[1]][$0[0]] = 1
//     }
    
//     for mid in 1..<n+1 {
//         for i in 1..<n+1 {
//             for j in 1..<n+1 {
//                 guard i != j else { continue }
                
//                 if matrix[i][j] > matrix[i][mid] + matrix[mid][j] {
//                     matrix[i][j] = matrix[i][mid] + matrix[mid][j]
//                 }
//             }
//         }
//     }
    
//     let max = matrix[1].filter { $0 != Double.infinity }.max()!
//     return matrix[1].filter { $0 == max }.count
// }

var d = [Double]()
var v = [Bool]()
var matrix = [[Double]]()

func getSmallIndex() -> Int {
    var min = Double.infinity
    var index: Int = 0
    for i in 1..<matrix.count {
        if d[i] < min && !v[i] {
            min = d[i]
            index = i
        }
    }
    return index
}

func dijkstra(start: Int) {
    for i in 1..<d.count {
        d[i] = matrix[start][i]
    }
    v[start] = true
    
    for _ in 1..<matrix.count {
        let current = getSmallIndex()
        v[current] = true
        
        for j in 1..<matrix.count {
            guard !v[j] else { continue }
            
            if d[j] > matrix[current][j] + d[current] {
                d[j] = matrix[current][j] + d[current]
            }
        }
    }
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    matrix = [[Double]](repeating: [Double](repeating: Double.infinity, count: n + 1), count: n + 1)
    edge.forEach {
        matrix[$0[0]][$0[1]] = 1
        matrix[$0[1]][$0[0]] = 1
    }
    
    d = [Double](repeating: 0, count: n + 1)
    v = [Bool](repeating: false, count: n + 1)
    
    dijkstra(start: 1)
    
    let max = d.filter { $0 != Double.infinity }.max()!
    return d.filter { $0 == max }.count
}

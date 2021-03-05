func filter(_ ary: [Int], _ answer: [Int]) -> Int {
    return (0..<answer.count).filter { ary[$0 % ary.count] == answer[$0] }.count
}


func solution(_ answers:[Int]) -> [Int] {
    let ary = [[1,2,3,4,5], [2,1,2,3,2,4,2,5], [3,3,1,1,2,2,4,4,5,5]]
    
    let answer = ary.map { filter($0, answers) }
    let max = answer.max()
    
    var res = [Int]()
    answer.enumerated().forEach {
        if $1 == max { res.append($0 + 1) }
    }
    
    return res
}

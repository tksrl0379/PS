import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    let ary: [Int] = zip(progresses, speeds).map { progress, speed in
        let left = 100 - progress
        return Int(ceil(Double(left) / Double(speed)))
    }
    
    var count = 1
    var standard = ary[0]
    var answer = [Int]()
    
    for i in 1..<ary.count {
        if standard >= ary[i] {
            count += 1
        } else {
            answer.append(count)
            count = 1
            standard = ary[i]
        }
    }
    
    answer.append(count)
    
    return answer
}

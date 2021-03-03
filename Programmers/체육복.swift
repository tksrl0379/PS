func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let common = Set(lost).intersection(reserve)
    var reserve = Set(reserve).subtracting(common)
    let lost = Set(lost).subtracting(common).sorted()
    var cnt = n - lost.count
    
    lost.forEach { l in
        if let _ = reserve.remove(l - 1) {
            cnt += 1
            return
        }
        
        if let _ = reserve.remove(l + 1) {
            cnt += 1
            return
        }
    }
    
    return cnt
}

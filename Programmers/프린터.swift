func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities: [(weight: Int, target: Bool)] = priorities.map { ($0, false) }
    priorities[location].target = true
    
    var count = 0
    while !priorities.isEmpty {
        
        let p = priorities.removeFirst()
    
        if priorities.contains(where: { $0.weight > p.weight }) {
            priorities.append(p)
        } else {
            count += 1
            if p.target { break }
            
        }
    }
    
    return count
}

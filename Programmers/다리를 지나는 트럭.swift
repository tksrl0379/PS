// 1차 풀이
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var truckWeights = truck_weights
    var bridgeInfo = [(truckWeight: Int, dist: Int)]()
    var count = 0
    var currWeights = 0
    
    repeat {
        count += 1
        
        if let dist = bridgeInfo.first?.dist, dist == 0 {
            let weight = bridgeInfo.removeFirst().truckWeight
            currWeights -= weight
        }

        if let truckWeight = truckWeights.first, weight >= currWeights + truckWeight {
            let weight = truckWeights.removeFirst()
            bridgeInfo.append((weight, bridge_length))
            currWeights += weight
        }
        
        bridgeInfo = bridgeInfo.map { ($0.truckWeight, $0.dist - 1) }
        
    } while !bridgeInfo.isEmpty
    
    return count
}

// 2차 풀이
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var truckWeights = truck_weights
    var bridgeWeights = [Int](repeating: 0, count: bridge_length)
    var count = 0
    var currWeights = 0
    
    while !bridgeWeights.isEmpty { 
        
        count += 1
        currWeights -= bridgeWeights.removeFirst()
        
        guard bridgeWeights.count <= bridge_length else { continue }
        
        if let truckWeight = truckWeights.first {
            if weight >= currWeights + truckWeight {
                bridgeWeights.append(truckWeight)
                currWeights += truckWeights.removeFirst()
            } else {
                bridgeWeights.append(0)
            }
        }
    }
    
    return count
}

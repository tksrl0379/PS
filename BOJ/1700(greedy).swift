// https://www.acmicpc.net/problem/1700


let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let N = input[0], K = input[1]
var devices = readLine()!.split(separator: " ").compactMap { Int($0) }

var used = [Bool](repeating: false, count: K + 1)
var plugs = [Int]()
var answer = 0

for index in 0..<devices.count {
    
    // 기기가 꽂혀있는 경우
    if used[devices[index]] { continue }
    
    // 빈 플러그가 있는 경우
    if plugs.count != N {
        plugs.append(devices[index])
        used[devices[index]] = true
    } else {
    // 빈 플러그가 없는 경우
        
        // 기기가 꽂혀있지 않는 경우
        // : 꽂혀있는 플러그 중 가장 늦게 사용되거나 사용되지 않을 플러그 선정해서 교체
        
        var plugIndex = 0
        var maxCount = Int.min
        for (tmpIndex, device) in plugs.enumerated() {
            var count = 0
            for i in index..<devices.count {
                if device == devices[i] { break }
                count += 1
            }
            
            if count > maxCount {
                maxCount = count
                plugIndex = tmpIndex
            }
        }
        
        // 선택된 디바이스는 플러그 뽑아주고
        // 새로운 디바이스 꽂아주기
        used[plugs[plugIndex]] = false
        
        used[devices[index]] = true
        plugs[plugIndex] = devices[index]
        
        answer += 1
    }
}

print(answer)

// https://www.acmicpc.net/problem/11054

let N = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ").compactMap { Int($0) }

var inc = Array(repeating: 1, count: N)
var dec = Array(repeating: 1, count: N)

for i in (1..<N) {
    
    var incValue: Int = 0
    var decValue: Int = 0
    for j in (0..<i) {
        // 1. 비교 대상(inputs[j])가 자기(inputs[i])보다 작은 경우 증가배열(inc)만 체크
        // 2. 비교 대상(inputs[j])가 자기(inputs[i])보다 큰 경우 증가배열(inc)과 감소배열(dec) 둘 다 체크
        
        if inputs[i] > inputs[j] {
            let value = inc[j]
            if value > incValue {
                incValue = value
            }
        } else if inputs[i] < inputs[j] {
            let value = max(inc[j], dec[j])
            if value > decValue {
                decValue = value
            }
        }
    }
    
    inc[i] = incValue + 1
    dec[i] = decValue + 1
}

print(max(inc.max()!, dec.max()!))


// 증가 배열: 각 인덱스별로 가장 큰 증가 수열의 길이를 구함
// 감소 배열: 각 인덱스별로 가장 큰 감소 수열의 길이를 구함

// 비교 대상이 자기보다 작은 경우엔 증가배열만 체크하는 이유
// ex. 비교 대상(5) 자기(10)이기 때문에 무조건 증가하는 방향으로만 체크 될 수 밖에 없음
// ex. 반대로, 비교 대상(10) 자기(5)인 경우엔, 8, 9, 10 ... 으로 증가하고 있는 경우와 12, 11, 10 ... 으로 감소하는 경우 둘 다 체크 가능함

// https://blog.naver.com/tksrl0379/222858256428

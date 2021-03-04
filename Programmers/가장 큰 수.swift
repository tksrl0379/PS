// 비효율적인 풀이
import Foundation

func cal(_ a: Int, maxLength: Int) -> String {
    let cnt = String(a).count
    var val = ""
    (0...Int(ceil(Double(maxLength - cnt)/Double(cnt)))).forEach { _ in
        val += String(a)
    }
    return String(val.prefix(maxLength))
}

func solution(_ numbers:[Int]) -> String {
    let maxLength = String(numbers.max { String($0).count < String($1).count }!).count // 바꾸기
    
    if numbers.filter { $0 != 0 }.count == 0 { return "0" }
    
    let numbers = numbers.sorted { a, b in
        let val = cal(a, maxLength: maxLength)
        let val2 = cal(b, maxLength: maxLength)
        return val > val2
    }
    
    return numbers.reduce("") { $0 + String($1) }
}


// 효율적인 풀이
func solution(_ numbers:[Int]) -> String {
        
    if numbers.filter { $0 != 0 }.count == 0 { return "0" }
    
    let numbers = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }
    
    return numbers.reduce("") { $0 + String($1) }
}

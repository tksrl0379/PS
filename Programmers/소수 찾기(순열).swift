var ary = [Character]()
var check = [Bool]()
var set: Set<Int> = []

func permutation(_ depth: Int, _ end: Int, _ numbers: [Character]) {
    if depth == end {
        set.insert(Int(String(ary[0..<end]))!)
    }
    
    for i in 0..<ary.count {
        guard !check[i] else { continue }
        
        check[i] = true
        ary[depth] = numbers[i]
        permutation(depth + 1, end, numbers)
        check[i] = false
    }
}

func isPrime(number: Int) -> Bool {
    if number < 2 { return false }
    for i in 2..<number {
        let a = Double(number) / Double(i)
        let b = number / i
        if a == Double(b) { return false }
    }
    
    return true
}

func solution(_ numbers: String) -> Int {
    
    ary = [Character](repeating: Character(" "), count: numbers.count)
    check = [Bool](repeating: false, count: numbers.count)
    
    (1...numbers.count).forEach {
        permutation(0, $0, Array(numbers))
    }
    
    var num = 1
    (0..<numbers.count).forEach { _ in
        num *= 10
    }
    var prime = [Bool](repeating: true, count: num + 1)
    prime[0] = false
    prime[1] = false
    for i in 2...num {
        guard prime[i] else { continue }
        
        var v = i * 2
        while v <= num {
            prime[v] = false
            v += i
        }
    }
    
    return set.filter { prime[$0] }.count
}

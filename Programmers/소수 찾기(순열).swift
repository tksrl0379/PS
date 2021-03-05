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

func isPrime(_ number: Int) -> Bool {
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
    
    return set.filter { isPrime($0) }.count
}

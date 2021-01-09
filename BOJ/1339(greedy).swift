// https://www.acmicpc.net/problem/1339

import Foundation

let N = Int(readLine()!)!
var weights = [Character: Int]()

var strs = [String]()

(0..<N).forEach { _ in
    let input = readLine()!
    strs.append(input)
    let size = input.count
    
    Array(input).enumerated().forEach { (index, character) in
        weights[character] = (weights[character] ?? 0) +  Int(pow(10, Double(size - 1 - index)))
    }
}

let sortedWeights = weights.sorted { $0.value > $1.value }.map { $0.key }
var dic = [Character: Int]()

sortedWeights.enumerated().forEach { (index, weight) in
    dic[weight] = 9 - index
}

var result = 0
strs.forEach { str in
    var tmp = ""
    str.forEach { character in
        tmp += String(dic[character]!)
    }
    result += Int(tmp)!
}
print(result)

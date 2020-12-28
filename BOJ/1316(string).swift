// https://www.acmicpc.net/problem/1316

import Foundation

var dic: [Character: Bool] = [:]

var counts = 0
let N = Int(readLine()!)!

(0..<N).forEach { _ in
  let word = readLine()!
  var exAlphabet = Character(" ")
  dic = [:]
  
  for alphabet in word where exAlphabet != alphabet {
    if let _ = dic[alphabet] { return } // 이미 사용한 단어면 return (count X)
    
    dic[exAlphabet] = true
    exAlphabet = alphabet
  }
  
  counts += 1
}
print(counts)

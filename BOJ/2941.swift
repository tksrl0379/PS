// 1차 정답

import Foundation

let input = Array(readLine()!)

let alphabets = ["c=","c-", "dz=", "d-", "lj", "nj", "s=", "z="]

var first = 0
var second = 1
var counts = 0

while input.count + 1 != second { // first == second ??
  
  let word = String(input[first..<second])
  if alphabets.contains(word) {
    counts += 1
    first = second
    
  } else {
    if second-first == 3 {
      first += 1
      counts += 1
    } else {
      second += 1
    }
  }
}

// 2차 정답

import Foundation

var input = readLine()!

let alphabets = ["c=","c-", "dz=", "d-", "lj", "nj", "s=", "z="]

for alphabet in alphabets {
  if input.contains(alphabet) {
    input = input.replacingOccurrences(of: alphabet, with: " ")
  }
}

print(input.count)

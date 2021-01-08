// https://www.acmicpc.net/problem/2947

import Foundation

var inputs = readLine()!.split(separator: " ").map { Int($0)! }

func swap() {
  for index in (1..<inputs.count) {
    if inputs[index - 1] > inputs[index] {
      let tmp = inputs[index - 1]
      inputs[index - 1] = inputs[index]
      inputs[index] = tmp
      print(inputs.map { String($0) }.joined(separator: " "))
    }
  }
  if inputs != [1,2,3,4,5] { swap() }
}

swap()

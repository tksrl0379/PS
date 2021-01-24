// https://www.acmicpc.net/problem/4949

import Foundation

let conditions = Array("([")

func isBalanced(input: String) -> Bool {

  var stack = [String]()
  
  for word in input {
    if conditions.contains(word) {
      stack.append(String(word))
    } else if word == ")", let lastWord = stack.last, lastWord == "(" {
      stack.popLast()
    } else if word == "]", let lastWord = stack.last, lastWord == "[" {
      stack.popLast()
    } else if word.isLetter || word.isWhitespace || word == "." {
      continue
    } else {
      return false // ')' or ']' 이 나왔는데 스택에 알맞은 괄호가 없는 경우
    }
  }
  
  return stack.isEmpty // 개수가 안 맞아서 스택에 '(' or '[' 가 남는 경우
}

while let input = readLine() {
  if input == "." { break }
  
  if isBalanced(input: input) { print("yes") }
  else { print("no") }
}

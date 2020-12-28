// https://www.acmicpc.net/problem/1541

import Foundation

let input = readLine()!

var total = 0
let expressions = input.split(separator: "-")

for (index, expression) in expressions.enumerated() {
  let subExpression = expression.split(separator: "+").map { Int($0)! }
  let subTotal = subExpression.reduce(0) { $0 + $1 }
  
  if index == 0 { total += subTotal }
  else { total -= subTotal }
}
print(total)

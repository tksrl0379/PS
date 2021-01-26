// https://www.acmicpc.net/problem/14891

import Foundation

func rightCal(origin: Int, direction: Int) {
  let rightNumber = origin + 1
  guard (0..<4) ~= rightNumber else { return }
    
  if gear[origin][2] == gear[rightNumber][6] {
    // 같은 경우 회전 X
    return
  } else {
    // 다른 경우 회전 O
    rightCal(origin: rightNumber, direction: -direction)
    rotation(object: rightNumber, direction: -direction)
  }
}

func leftCal(origin: Int, direction: Int) {
  let leftNumber = origin - 1
  guard (0..<4) ~= leftNumber else { return }
  
  if gear[origin][6] == gear[leftNumber][2] {
    return
  } else {
    leftCal(origin: leftNumber, direction: -direction)
    rotation(object: leftNumber, direction: -direction)
  }
}

func rotation(object: Int, direction: Int) {
  if direction == 1 {
    // 시계
    let value = gear[object].removeLast()
    gear[object].insert(value, at: 0)
  } else {
    // 반시계
    let value = gear[object].removeFirst()
    gear[object].append(value)
  }
}


var gear = [[Int]]()

(0..<4).forEach { _ in
  gear.append(readLine()!.map { Int(String($0))! })
}

let k = Int(readLine()!)!
(0..<k).forEach { _ in
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let number = input[0] - 1 // 톱니바퀴 번호
  let direction = input[1]  // 회전 방향(1: 시계, -1: 반시계)
  
  leftCal(origin: number, direction: direction)
  rightCal(origin: number, direction: direction)
  
  rotation(object: number, direction: direction)
}

var totalPoint = 0
gear.indices.forEach {
  let point = pow(2.0, Double($0))
  if gear[$0][0] == 1 { totalPoint += Int(point) }
}
print(totalPoint)

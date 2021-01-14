// https://www.acmicpc.net/problem/1713

import Foundation

let N = Int(readLine()!)!
let recommendCounts = Int(readLine()!)
let recommendOrder = readLine()!.split(separator: " ").map { Int($0)! }

var frames: [(number: Int, recCounts: Int, oldCounts: Int)] = []

recommendOrder.enumerated().forEach { (offset, studentNumber) in

  // 이미 있는 경우 추천 횟수 증가하고 종료
  if let index = frames.firstIndex { $0.number == studentNumber } {
    frames[index].recCounts += 1
    return
  }
  
  // 꽉 차있지 않은 경우 추가하고 종료
  if frames.count != N {
    frames.append((studentNumber, 1, offset))
    return
  }
  
  // 추천 횟수가 가장 적은 학생이 한 명인 경우 종료
  let minRecCounts = frames.min { $0.recCounts < $1.recCounts }!.recCounts
  let sameStudent = frames.filter { $0.recCounts == minRecCounts }
  if sameStudent.count == 1 {
    frames = frames.filter { $0.recCounts != minRecCounts }
    frames.append((studentNumber, 1, offset))
    return
  }
  
  // 추천 횟수가 같은 학생들 중 가장 오래된 학생 선정하여 제거
  let oldestStudentNumber = sameStudent.min { $0.oldCounts < $1.oldCounts }!.number
  if let index = frames.firstIndex { $0.number == oldestStudentNumber } {
    frames.remove(at: index)
    frames.append((studentNumber, 1, offset))
    return
  }
}

let sortedFrames = frames.sorted { $0.number < $1.number }.map { String($0.number) }
print(sortedFrames.joined(separator: " "))

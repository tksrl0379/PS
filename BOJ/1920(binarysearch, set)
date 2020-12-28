// https://www.acmicpc.net/problem/1920


// 1차 정답: binary search
import Foundation

func binarySearch(target: Int) -> Int {
  var start = 0
  var end = nAry.count - 1
  
  while end >= start {
    let mid = Int((end + start) / 2)
    
    if nAry[mid] < target {
      start = mid + 1
    } else if nAry[mid] > target{
      end = mid - 1
    } else {
      return 1
    }
  }
  
  return 0
}

let N = Int(readLine()!)!
let nAry = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }
let M = Int(readLine()!)!
let mAry = readLine()!.split(separator: " ").map { Int($0)! }

mAry.forEach {
  print(binarySearch(target: $0))
}


// 2차 정답: Set 
import Foundation

let N = Int(readLine()!)!
let nAry = Set(readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 })
let M = Int(readLine()!)!
let mAry = readLine()!.split(separator: " ").map { Int($0)! }

mAry.forEach {
  
  if nAry.contains($0) { print("1") }
  else { print("0") }
}

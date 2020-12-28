import Foundation

var T = Int(readLine()!)!

(0..<T).forEach { _ in
  
  let str = Array(readLine()!)
  var cnt = 0
  
  for word in str {
    // 1. ( 가 더 많을 때 2. ) 가 더 많을 때
    
    if word == "(" {
      cnt += 1
    } else {
      cnt -= 1
    }
    
    if cnt < 0 { // empty. 즉, 스택에 ( 가 없는데 ) 가 나올 때
      break
    }
  }
  
  print(cnt == 0 ? "YES" : "NO")
}

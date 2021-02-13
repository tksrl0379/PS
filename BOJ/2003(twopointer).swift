// https://www.acmicpc.net/problem/2003


let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let seq = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let N = input[0]
let S = input[1]

var end = 0
var sum = 0
var answer = 0

for start in 0..<N {
    // 총합(sum) 이 S보다 작고 end 가 아직 끝까지 가지 않은 경우엔 end를 계속해서 늘리며 총합 계산
    while sum < S && end < N {
        sum += seq[end]
        end += 1
    }
    // 총합(sum)이 S와 같거나 커진 경우 or end가 끝까지 가면 아래가 수행된다.

    // 만약 총합(sum) 이 S 와 같으면 카운트 증가,
    if sum == S { answer += 1 }
    // 총합(sum) 이 주어진 조건 S보다 커졌으므로 seq[start] 만큼 빼줘야 한다.
    sum -= seq[start]
    
}

print(answer)
[출처] [Swift] 수들의 합2 / 다이어트|작성자 재밌게

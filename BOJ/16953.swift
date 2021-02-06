// https://www.acmicpc.net/problem/16953

// Greedy

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }

let A = input[0]
let B = input[1]

var num = B
var count = 0

while num > A {
    
    if num % 10 == 1 {
        num /= 10
    } else {
        if num % 2 == 1 { break } // 홀수인데 뒤에 1이 안 오는 경우
        num /= 2
    }
    count += 1
}
print(num == A ? count + 1 : -1)


// BFS

let input = readLine()!.split(separator: " ").compactMap{ Int(String($0)) }

let A = input[0]
let B = input[1]

var num = B
var count = 0

var queue: [(num: Int, count: Int)] = []
queue.append((A, 1))

var answer = -1
while !queue.isEmpty {
    
    let (num, count) = queue.removeFirst()
    
    if num == B {
        answer = count
        break
    }
    
    let new1 = num * 2
    let new2 = num * 10 + 1
    
    if B >= new1 { queue.append((new1, count + 1)) }
    if B >= new2 { queue.append((num * 10 + 1, count + 1)) }
}

print(answer)

// https://www.acmicpc.net/problem/2810

let N = Int(readLine()!)!
let seats = Array(readLine()!)

var isCouple = false
var index = 0
var count = 0
while index < N {
    if seats[index] == "S" {
        index += 1
    } else {
        isCouple = true
        index += 2
    }
    count += 1
}
print(isCouple ? count + 1 : count)

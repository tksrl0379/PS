// https://www.acmicpc.net/problem/1439

let S = readLine()!

let zeroAry = S.split(separator: "1").compactMap { $0 }
let oneAry = S.split(separator: "0").compactMap { $0 }

print(zeroAry.count > oneAry.count ? oneAry.count : zeroAry.count)

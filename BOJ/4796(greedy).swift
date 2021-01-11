var count = 1
while true {
    let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    let L = input[0], P = input[1], V = input[2]
    
    guard !(L == 0 && P == 0 && V == 0) else { break }

    print("Case \(count): \((V/P) * L + min(V%P, L))")
    count += 1
}

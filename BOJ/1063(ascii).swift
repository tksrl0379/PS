// https://www.acmicpc.net/problem/1063
// 아스키 코드 값 이용


let size = 8

extension Character {
    func toX() -> Int {
        Int(self.asciiValue! - Character("A").asciiValue!)
    }
}

extension Int {
    func toAlphabet() -> String {
        let value = UnicodeScalar(self + Int(UnicodeScalar("A").value))
        return String(value!)
    }
}

func position(value: [Character]) -> (y: Int, x: Int) {
    let x = value[0].toX()
    let y = abs(Int(String(value[1]))! - size)
    
    return (Int(y), Int(x))
}

let inputs = readLine()!.split(separator: " ").compactMap { String($0) }
let king = Array(inputs[0])
let stone = Array(inputs[1])
let moveCount = Int(inputs[2])!

let moveInfo: [String: (y: Int, x: Int)] = [
    "R": (0, 1),
    "L": (0, -1),
    "B": (1, 0),
    "T": (-1, 0),
    "RT": (-1, 1),
    "LT": (-1, -1),
    "RB": (1, 1),
    "LB": (1, -1)
]

var kingPos = position(value: king)
var stonePos = position(value: stone)

(0..<moveCount).forEach { _ in
    let move = readLine()!

    let (y, x) = moveInfo[move]!
    let ny = kingPos.y + y
    let nx = kingPos.x + x
    
    guard (0..<size) ~= ny && (0..<size) ~= nx else { return }
    
    if ny == stonePos.y && nx == stonePos.x {
        
        guard (0..<size) ~= (ny + y) && (0..<size) ~= (nx + x) else { return }
        
        stonePos.y = ny + y
        stonePos.x = nx + x
        
        kingPos.y = ny
        kingPos.x = nx
    } else {
        
        kingPos.y = ny
        kingPos.x = nx
    }
}
print("\(kingPos.x.toAlphabet())\(abs(kingPos.y - size))")
print("\(stonePos.x.toAlphabet())\(abs(stonePos.y - size))")

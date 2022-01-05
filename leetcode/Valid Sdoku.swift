// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/769/

// 1차 정답
// 이런 종류의 문제를 너무 싫어해서 그냥 하드코딩 수준으로 풀었다.

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        for r in (0..<3) {
            for c in (0..<3) {
                var checks = [Bool](repeating: false, count: 10)
                checks[0] = true
                
                for row in ((r * 3)...(r * 3 + 2)) {
                    for column in ((c * 3)...(c * 3 + 2)) {
                        guard board[row][column] != Character(".") else {
                            continue
                        }
                        if checks[Int(String(board[row][column]))!] {
                            return false
                        } else {
                            checks[Int(String(board[row][column]))!] = true
                        }
                        
                    }
                }
            }
        }
        
        for r in (0..<9) {
            var checks = [Bool](repeating: false, count: 10)
            checks[0] = true
            for c in (0..<9) {
                guard board[r][c] != Character(".") else {
                    continue
                }
                if checks[Int(String(board[r][c]))!] {
                    return false
                } else {
                    checks[Int(String(board[r][c]))!] = true
                }
            }
        }
        
        for c in (0..<9) {
            var checks = [Bool](repeating: false, count: 10)
            checks[0] = true
            for r in (0..<9) {
                guard board[r][c] != Character(".") else {
                    continue
                }
                if checks[Int(String(board[r][c]))!] {
                    return false
                } else {
                    checks[Int(String(board[r][c]))!] = true
                }
            }
        }
        
        return true
    }
}

// 2차 정답
// 내가 푼건 아니고, 깔끔해보여서 가져왔다.
// 딕셔너리를 배열에 담아서 푸는게 포인트

func isValidSudoku(_ board: [[Character]]) -> Bool {
        var columnCounts: [[Character: Int]] = [[Character: Int]](repeating: [:], count: 9)
        var squareCounts: [[Character: Int]]  = [[Character: Int]](repeating: [:], count: 9)
        
        for row in 0..<9 {
            var rowCount: [Character: Int] = [:]
            let boardRow = board[row]
            for column in 0..<9 {
                let char = boardRow[column]
                if char == "." { continue }
                
                if let rowCharCount = rowCount[char] {
                    return false
                }
                rowCount[char] = 1
                
                var columnCount = columnCounts[column]
                if let columnCharCount = columnCount[char] {
                    return false
                }
                columnCount[char] = 1
                columnCounts[column] = columnCount
                
                let square = (row/3)*3 + (column/3)
                var squareCount = squareCounts[square]
                if let squareCharCount = squareCount[char] {
                    return false
                }
                squareCount[char] = 1
                squareCounts[square] = squareCount
            }
        }
        return true
    }
}

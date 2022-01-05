// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/770/

// 행렬을 오른쪽으로 90도 회전 시키는 문제
// 한 번 transpose 하고 각 행을 reverse하면 된다.

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        
        // 1. transpose
        (0..<n).forEach { row in
            (0..<row).forEach { column in
                let tmp = matrix[column][row]
                matrix[column][row] = matrix[row][column]
                matrix[row][column] = tmp
            }
        }
        
        // 2. reverse each row
        (0..<n).forEach { row in
            matrix[row].reverse()
        }
    }
}

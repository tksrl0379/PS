// https://leetcode.com/explore/learn/card/fun-with-arrays/525/inserting-items-into-an-array/3245/

// 1차 정답 (160ms)

class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var i = 0
        while i < arr.count  {
            if arr[i] == 0 && i + 1 < arr.count {
                shift(&arr, of: i)
                i += 1
            }
            i += 1
        }

    }

    func shift(_ arr: inout [Int], of index: Int) {
        var n = arr.count - 1
        while n > index {
            arr[n] = arr[n - 1]
            n -= 1
        }
    }
}

// 2차 정답 (40ms)
class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        var answer = [Int]()
        
        for v in arr {
            answer.append(v)
            
            if v == 0 {
                answer.append(v)
            }
        }
        
        arr = Array(answer[0..<arr.count])
    }
}

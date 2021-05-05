// https://leetcode.com/explore/learn/card/fun-with-arrays/527/searching-for-items-in-an-array/3250/

// 1차 정답 O(N^2)

class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        for i in 0..<arr.count {
            for j in 0..<arr.count where j != i && arr[i] * 2 == arr[j] {
                return true
            }
        }
        return false
    }
}

// 2차 정답

class Solution {
    func checkIfExist(_ arr: [Int]) -> Bool {
        var checks = [Int: Int]()
        
        for i in 0..<arr.count {
            let val = arr[i]
            checks[val] = i
        }
        
        for i in 0..<arr.count {
            let val = arr[i]
            if let j = checks[val * 2], j != i {
                return true
            }
        }
        
        return false
    }
}

// https://leetcode.com/explore/learn/card/fun-with-arrays/527/searching-for-items-in-an-array/3251/

// 1차 정답: 예외 케이스 처리 때문에 코드가 일관성이 없고 다소 난잡함

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        
        guard arr.count >= 3 && arr[0] < arr[1] else {
            return false
        }
        
        var ascending = true
        
        for i in 1..<arr.count {
            if ascending {
                if arr[i] < arr[i - 1] {
                    ascending = !ascending
                } else if arr[i] == arr[i - 1] {
                    return false
                }
            } else {
                if arr[i] >= arr[i - 1] {
                    return false
                }
            }
        }
        
        return ascending ? false : true
    }
}

// 2차 정답
// while 문이 2개 있긴 하지만, 결국 특정 조건을 만족할 때까지만 순회하므로 N번만 순회함. ex) N/2 + N/2 = N, N/3 + 2N/3 = N
// 각 while 문의 조건에서 left + 1, right - 1 이 있으므로 index out of range 가 일어나지 않도록 left, right 의 범위 설정에만 주의해 주면 된다.

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        
        guard arr.count >= 3 else {
            return false
        }
        
        var left = 0
        var right = arr.count - 1
        
        while left < arr.count - 1 && arr[left] < arr[left + 1] {
            left += 1
        }
        
        while right > 0 && arr[right] < arr[right - 1] {
            right -= 1
        }
        
        return left == right && left != 0 && right != arr.count - 1
    }
}

// https://leetcode.com/problems/two-sum/submissions/
// 입력값이 널널한건지 시간복잡도 대비 생각보다 시간 차이는 안남

// 1차: 정렬 + 투 포인터

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        let nums = nums.enumerated().map { i, v in
            (value: v, index: i)
        }.sorted { $0.value < $1.value }
        
        var start = 0
        var end = nums.count - 1
        
        while start < end {
            let sum = nums[start].value + nums[end].value
            
            if sum == target {
                return [nums[start].index, nums[end].index]
            } else if sum < target {
                start += 1
            } else {
                end -= 1
            }
        }
        
        return []
    }
}


// 2차: 딕셔너리
// '배열의 특정 값'을 딕셔너리에 키로 등록하고 'target - 배열의 다른 특정 값'이 딕셔너리에 등록돼있는지 탐색

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic: [Int: Int] = [:]
        
        for (index, num) in nums.enumerated() {
            if let ansIndex = dic[target - num] {
                return [index, ansIndex]
            } else {
                dic[num] = index
            }
        }

        return []
    }
}


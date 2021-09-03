// https://leetcode.com/problems/two-sum/submissions/
// 입력값이 널널한건지 시간복잡도 대비 생각보다 시간 차이는 안남

// 1차: 정렬 + 투 포인터

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var sortedNums: [(num: Int, index: Int)] = []
        nums.indices.forEach { sortedNums.append((nums[$0], $0)) }
        sortedNums = sortedNums.sorted { $0.num < $1.num }
        
        var start = 0
        var end = sortedNums.count - 1
        var sum = 0
        
        while end > start {
            sum = sortedNums[start].num + sortedNums[end].num
            
            if sum == target {
                break
            } else if sum < target {
                start += 1
            } else {
                end -= 1
            }
        }
        return [sortedNums[start].index, sortedNums[end].index]
    }
}


// 2차: 딕셔너리

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


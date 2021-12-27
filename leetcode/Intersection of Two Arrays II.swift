// https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/674/

// 1차 정답
// nums1, nums2 2 배열 각각 딕셔너리 만들어서 풀이

class Solution {
   func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

       let dict1 = nums1.reduce(into: [Int: Int]()) { dict, num in
           dict[num, default: 0] += 1
       }

       let dict2 = nums2.reduce(into: [Int: Int]()) { dict, num in
           dict[num, default: 0] += 1
       }

       return dict1.reduce(into: [Int]()) { ary, keyValue in
           let key1 = keyValue.key
           let value1 = keyValue.value
           guard let value2 = dict2[key1] else {
               return
           }
           let value = min(value1, value2)
           ary += Array(repeating: key1, count: value)
       }
   }
}

// 2차 정답
// 딕셔너리는 nums1에 대해서만 만들고, nums2는 nums1으로 만든 딕셔너리 검사해서 겹치는게 있는지 체크

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var dict = nums1.reduce(into: [Int: Int]()) { dict, num in
            dict[num, default: 0] += 1
        }
        
        return nums2.reduce(into: [Int]()) { ary, num in
            guard let value = dict[num], value > 0 else {
                return
            }
            dict[num] = dict[num]! - 1
            ary.append(num)
        }
    }
}

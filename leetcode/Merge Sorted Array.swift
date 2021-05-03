// https://leetcode.com/explore/learn/card/fun-with-arrays/525/inserting-items-into-an-array/3253/
// 투포인터

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var left = 0
        var right = 0
        
        var tmp = [Int]()
        
        while left < m && right < n {
            if nums1[left] > nums2[right] {
                tmp.append(nums2[right])
                right += 1
            } else {
                tmp.append(nums1[left])
                left += 1
            }
        }
        
        if left < m {
            tmp.append(contentsOf: nums1[left..<m])
        } else {
            tmp.append(contentsOf: nums2[right..<n])
        }
        
        nums1 = tmp
    }
}

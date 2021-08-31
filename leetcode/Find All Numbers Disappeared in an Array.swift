// https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3270/

class Solution {
    
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var ary = [Int](repeating: -1, count: nums.count + 1)
        nums.forEach { ary[$0] = 1 }
        return ary[1...].indices.filter { ary[$0] == -1 }
    }
}

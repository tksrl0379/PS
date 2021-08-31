// https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3228/

class Solution {
    func heightChecker(_ heights: [Int]) -> Int {
        let expected = heights.sorted()
        return zip(heights, expected).filter { $0 != $1 }.count
    }
}

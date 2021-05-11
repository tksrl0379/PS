// https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3259/

class Solution {
    
    func replaceElements(_ arr: [Int]) -> [Int] {
        var arr = arr
        
        var i = 0
        while i < arr.count - 1 {
            
            let maxValueIndex = findIndexOfMaxValue(arr, startIndex: i + 1)
            for j in i..<maxValueIndex {
                arr[j] = arr[maxValueIndex]
            }
            
            i = maxValueIndex
        }
        
        arr[arr.count-1] = -1
        return arr
    }
    
    private func findIndexOfMaxValue(_ arr: [Int], startIndex: Int) -> Int {
        var maxValue = arr[startIndex]
        var indexOfMaxValue = startIndex
        for i in startIndex..<arr.count {
            if maxValue < arr[i] {
                maxValue = arr[i]
                indexOfMaxValue = i
            }
        }
        
        return indexOfMaxValue
    }
}

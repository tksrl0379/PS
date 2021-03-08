var cnt = 0
var targetNumbers = [Int]()
var targetNum = 0

func dfs(_ depth: Int, _ totalNum: Int) {
    if depth == targetNumbers.count {
        if totalNum == targetNum {
            cnt += 1
        }
        return
    }
    
    dfs(depth + 1, totalNum + targetNumbers[depth])
    dfs(depth + 1, totalNum - targetNumbers[depth])
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    targetNumbers = numbers
    targetNum = target
    
    dfs(0, 0)
    
    return cnt
}

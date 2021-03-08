func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    var width = yellow
    var height = 1
    
    while width >= height {
        let totalSize = (width + 2) * (height + 2)
        let yellowSize = width * height
        let brownSize = totalSize - yellowSize
        
        if brownSize == brown && yellowSize == yellow {
            return [width + 2, height + 2]
        } else {
            height += 1
            while yellow % height != 0 {
                height += 1
            }
            
            width = yellow / height
        }
    }
    
    return []
}

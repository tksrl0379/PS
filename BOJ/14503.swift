// https://www.acmicpc.net/problem/14503

var size = readLine()!.split(separator: " ").map{Int($0)!}
var coor = readLine()!.split(separator: " ").map{Int($0)!}
var mat: [[Int]] = []

var N = size[0]
var M = size[1]

var r = coor[0]
var c = coor[1]
var d = coor[2]

var clean = 1

var directions = [-1, 1, 1, -1]

for _ in 0..<N {
    mat.append(readLine()!.split(separator: " ").map{Int($0)!})
}
mat[r][c] = -1

func inspect()-> Bool {
    for i in 0...3 {
        
        // 왼쪽 전환 (0,2 / 북,남,  1,3 / 동,서 )
        if d == 0 {
            d = 3
        } else {
            d -= 1
        }
        
        // 북, 남
        if d % 2 == 0 {
            
            // a. 청소하지 않은 공간 존재
            if mat[r + directions[d]][c] == 0 {
                r += directions[d]
                clean += 1
                mat[r][c] = -1
                
                return true
            
            // b. 벽 or 이미 청소
            } else {
                continue
            }
            
        // 동, 서
        } else {
       
            // a. 청소하지 않은 공간 존재
            if mat[r][c + directions[d]] == 0 {
                c += directions[d]
                clean += 1
                mat[r][c] = -1
                
                return true
            
            // b. 벽 or 이미 청소
            } else {
                continue
            }
        }
    }
    
    return false
}

while true {
    
    // c, d. 4방향 다 청소가 되었거나 벽인 경우
    if !inspect() {
        
        // 북, 남
        if d % 2 == 0 {
            
            // d. 뒤쪽 방향이 벽인 경우
            if mat[r - directions[d]][c] == 1 {
                break
            
            // c. 뒤쪽 방향이 벽이 아닌 경우
            } else {
                r = r - directions[d]
                inspect()
            }

        // 동, 서
        } else {
            // d. 뒤쪽 방향이 벽인 경우
            if mat[r][c - directions[d]] == 1 {
                break
            } else {
                // c. 뒤쪽 방향이 벽이 아닌 경우
                c = c - directions[d]
                inspect()
            }
        }
    }
    
}

print(clean)

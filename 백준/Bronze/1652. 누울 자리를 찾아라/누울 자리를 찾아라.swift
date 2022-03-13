// MARK: - 1652번
let N = Int(readLine()!)!
var room: [[String]] = []

for _ in 0..<N {
    room.append(readLine()!.map{String($0)})
}

var rowCount: Int = 0 // 가로 가능 횟수
for i in 0..<N {
    var count: Int = 0 // 2이상인지 체크하기 위해.
    var goCheck: Bool = false
    
    for j in 0..<N {
        if room[i][j] == "." {
            count += 1
        }
        else if room[i][j] == "X" {
            goCheck = true // 지금까지 쌓인 게 2 이상인지 체크하러 감.
        }
        
        if j == N - 1 { // X없이(or 끝에 X가 없이) 인덱스 끝까지 도달했을 떄,
            goCheck = true
        }
        
        if goCheck {
            if count >= 2 {
                rowCount += 1
            }
            count = 0 // X로 인해 체크했기 때문에, 다시 0으로 초기화.
            goCheck = false // check했으니 false.
        }
    }
}

var colCount: Int = 0 // 가로 가능 횟수
for i in 0..<N {
    var count: Int = 0 // 2이상인지 체크하기 위해.
    var goCheck: Bool = false
    
    for j in 0..<N {
        if room[j][i] == "." {
            count += 1
        }
        else if room[j][i] == "X" {
            goCheck = true // 지금까지 쌓인 게 2 이상인지 체크하러 감.
        }
        
        if j == N - 1 { // X없이(or 끝에 X가 없이) 인덱스 끝까지 도달했을 떄,
            goCheck = true
        }
        
        if goCheck {
            if count >= 2 {
                colCount += 1
            }
            count = 0 // X로 인해 체크했기 때문에, 다시 0으로 초기화.
            goCheck = false // check했으니 false.
        }
    }
}

print(rowCount, colCount)

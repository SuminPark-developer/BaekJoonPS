// MARK: - 1236번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var castle: [[String]] = []

for _ in 0..<N {
    castle.append(readLine()!.map{String($0)})
}

var rowCount: Int = 0
var colCount: Int = 0

for i in 0..<N {
    var checkFlag: Bool = false // 경비병 유무 체크.
    
    for j in 0..<M {
        if castle[i][j] == "X" { // 경비병 있으면,
            checkFlag = true
            break
        }
    }
    
    if checkFlag == false {
        rowCount += 1
    }
    
}

for i in 0..<M {
    var checkFlag: Bool = false // 경비병 유무 체크.
    
    for j in 0..<N {
        if castle[j][i] == "X" { // 경비병 있으면,
            checkFlag = true
            break
        }
    }
    
    if checkFlag == false {
        colCount += 1
    }
}

print(max(rowCount, colCount))

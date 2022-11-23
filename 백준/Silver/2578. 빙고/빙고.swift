// MARK: - 2578번
var board: [[Int]] = []
var bingo: [[Bool]] = Array(repeating: Array(repeating: false, count: 5), count: 5)

for _ in 0..<5 {
    board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var calls: [Int] = []
for _ in 0..<5 {
    let temp: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    calls += temp
}

func findIndex(_ num: Int) -> (Int, Int) {
    for y in 0..<5 {
        for x in 0..<5 {
            if board[y][x] == num {
                return (y, x)
            }
        }
    }
    return (-1, -1) // 여기는 올 일 없음.
}

func bingoCount() -> Int {
    var lineCount: Int = 0
    
    for y in 0..<5 { // 가로줄 빙고 체크.
        var tempCount: Int = 0
        for x in 0..<5 {
            if bingo[y][x] == false {
                break
            }
            else {
                tempCount += 1
            }
            
            if tempCount == 5 { // 빙고면,
                lineCount += 1
            }
        }
    }
    
    for x in 0..<5 { // 세로줄 빙고 체크.
        var tempCount: Int = 0
        for y in 0..<5 {
            if bingo[y][x] == false {
                break
            }
            else {
                tempCount += 1
            }
            
            if tempCount == 5 { // 빙고면,
                lineCount += 1
            }
        }
    }
    
    if (bingo[0][0] == true) && (bingo[1][1] == true) && (bingo[2][2] == true) && (bingo[3][3] == true) && (bingo[4][4] == true) {
        lineCount += 1
    }
    
    if (bingo[0][4] == true) && (bingo[1][3] == true) && (bingo[2][2] == true) && (bingo[3][1] == true) && (bingo[4][0] == true) {
        lineCount += 1
    }
    
    return lineCount
}

var count: Int = 0
for call in calls {
    count += 1
    
    let (y, x) = findIndex(call)
    bingo[y][x] = true
    
    if bingoCount() >= 3 {
        print(count)
        break
    }
}


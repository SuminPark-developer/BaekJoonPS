// MARK: - 17136번(백트래킹)
var board: [[Int]] = Array(repeating: [], count: 10)
for i in 0..<10 {
    board[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}
var paper: [Int] = Array(repeating: 0, count: 5 + 1) // 종류별 사용한 색종이의 수.
var answer: Int = 25 // 최대 : 5장 다 사용 * 5종류

func isPossible(_ coordY: Int, _ coordX: Int, _ paperSize: Int) -> Bool { // 좌측상단(y, x)의 색종이를 덮을 수 있는지.
    if paper[paperSize] == 5 { // 해당 종류의 색종이를 다 썼다면,
        return false
    }
    
    if (coordY + paperSize > 10) || (coordX + paperSize > 10) { // 좌표값 넘어가면,
        return false
    }
    
    for y in coordY..<coordY + paperSize {
        for x in coordX..<coordX + paperSize {
            if board[y][x] == 0 { // 0이 있어서 못 덮는 상황이라면,
                return false
            }
        }
    }
    return true // 여기까지 온 거라면, 덮을 수 있다는 뜻이기 때문에 true리턴.
}

func mark(_ coordY: Int, _ coordX: Int, _ paperSize: Int, _ value: Int) { // 색종이 덮는 함수. (혹은 떼어냄)
    for y in coordY..<coordY + paperSize {
        for x in coordX..<coordX + paperSize {
            board[y][x] = value
        }
    }
    
    if value == 0 { // 색종이를 덮음.
        paper[paperSize] += 1 // 색종이 사용 횟수 증가.
    }
    else if value == 1 { // 색종이를 떼어냄.
        paper[paperSize] -= 1 // 색종이 사용 횟수 감소.
    }
}

func backtracking(_ y: Int, _ x: Int) {
    if y == 10 { // 최종 도달.
        answer = min(answer, paper.reduce(0, +))
//        print(paper, answer)
        return
    }
    
    if x == 10 { // 열의 끝에 도달.
        backtracking(y + 1, 0) // 다음 행으로 넘어감.
        return
    }
    
    if board[y][x] == 0 { // 못 덮는 곳이면,
        backtracking(y, x + 1) // 다음 열로 넘어감.
        return
    }
    
    for size in 1...5 {
        if isPossible(y, x, size) { // (y, x)에 size의 색종이를 덮을 수 있다면,
            mark(y, x, size, 0) // (y, x)에 size의 색종이를 0으로 덮음.
//            print("before: \(y), \(x), \(size)")
            backtracking(y, x + 1) // 다음 열로 이동.
            mark(y, x, size, 1) // 원상복구. (y, x)에 다시 기존값으로 되돌려놓음.
//            print("after: \(y), \(x), \(size)")
        }
//        else {
//            print("불가능: \(y), \(x), \(size)")
//        }
    }
    
}

backtracking(0, 0)
print(answer == 25 ? -1 : answer)

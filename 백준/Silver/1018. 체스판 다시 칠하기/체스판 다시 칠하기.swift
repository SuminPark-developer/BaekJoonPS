// MARK: - 1018번(완전탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

var board: [[String]] = []
board.append(Array(repeating: ".", count: M + 1))
for _ in 0..<N {
    board.append(["."] + readLine()!.map{String($0)})
}

let (endY, endX) = ((N - 8) + 1, (M - 8) + 1)

var answerArray: [Int] = []
for startY in 1...endY {
    for startX in 1...endX {
        let answerTemp: Int = min(startW(startY, startX), startB(startY, startX)) // W 시작 Case, B 시작 Case 중 작은 값 저장.
        answerArray.append(answerTemp)
    }
}

print(answerArray.min()!) // 가장 최소값 출력.

func startW(_ startY: Int, _ startX: Int) -> Int { // W로 시작 Case.
    var count: Int = 0 // 변경 횟수 카운팅.
    
    for y in startY..<startY + 8 {
        for x in startX..<startX + 8 {
            if ((y % 2 == 1) && (x % 2 == 1)) || ((y % 2 == 0) && (x % 2 == 0)) { // W여야 함.
                if board[y][x] != "W" {
                    count += 1
                }
            }
            else if ((y % 2 == 1) && (x % 2 == 0)) || ((y % 2 == 0) && (x % 2 == 1)) { // B여야 함.
                if board[y][x] != "B" {
                    count += 1
                }
            }
        }
    }
    return count
}

func startB(_ startY: Int, _ startX: Int) -> Int { // B로 시작 Case.
    var count: Int = 0 // 변경 횟수 카운팅.
    
    for y in startY..<startY + 8 {
        for x in startX..<startX + 8 {
            if ((y % 2 == 1) && (x % 2 == 1)) || ((y % 2 == 0) && (x % 2 == 0)) { // B여야 함.
                if board[y][x] != "B" {
                    count += 1
                }
            }
            else if ((y % 2 == 1) && (x % 2 == 0)) || ((y % 2 == 0) && (x % 2 == 1)) { // W여야 함.
                if board[y][x] != "W" {
                    count += 1
                }
            }
        }
    }
    return count
}

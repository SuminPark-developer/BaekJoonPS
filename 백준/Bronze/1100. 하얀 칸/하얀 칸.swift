// MARK: - 1100번
var chess: [[String]] = [] // 8x8 체스판

for _ in 0..<8 {
    let input = readLine()!.map{String($0)}
    chess.append(input)
}

var count: Int = 0 // 하얀 칸 위에 말 개수

for i in 0..<8 {
    for j in 0..<8 {

        if i % 2 == 0 { // 짝수 행일 땐,
            if j % 2 == 0 { // 짝수 열들이 하얀칸.
                if chess[i][j] == "F" {
                    count += 1
                }
            }
        }
        else { // 홀수 행일 땐,
            if j % 2 == 1 { // 홀수 열들이 하얀칸.
                if chess[i][j] == "F" {
                    count += 1
                }
            }
        }

    }
}

print(count)

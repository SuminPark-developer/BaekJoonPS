// MARK: - 3028번
let input = readLine()!.map{String($0)}
var ball = ["O", "X", "X"]

for ch in input {
    
    switch ch {
    case "A":
        ball.swapAt(0, 1)
    case "B":
        ball.swapAt(1, 2)
    case "C":
        ball.swapAt(2, 0)
    default:
        print("default는 없음.")
    }
    
}

for (index, ch) in ball.enumerated() {
    if ch == "O" {
        print(index + 1)
        break
    }
}

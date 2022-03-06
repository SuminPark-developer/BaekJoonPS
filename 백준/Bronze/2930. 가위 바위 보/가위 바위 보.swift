// MARK: - 2930번
let R = Int(readLine()!)!
let sanguen = Array(readLine()!).map{String($0)}
let N = Int(readLine()!)!
var friends: [[String]] = Array(repeating: Array(repeating: "", count: R), count: N) // N행 R열

for i in 0..<N {
    var j: Int = 0
    let input = readLine()!.map{String($0)}
    
    for ch in input {
        friends[i][j] = ch
        j += 1
    }
    
}

var score: Int = 0

for i in 0..<N { // 가로로 루프 돎.
    for j in 0..<R {
        if (sanguen[j] == "S" && friends[i][j] == "P") || (sanguen[j] == "P" && friends[i][j] == "R") || (sanguen[j] == "R" && friends[i][j] == "S") { // 상근이가 이길 때,
            score += 2
        }
        else if (sanguen[j] == friends[i][j]) { // 비길 때,
            score += 1
        }
        else { // 질 때, (이 부분은 없어도 됨.)
            score += 0
        }
    }
}

print(score)

var maxScore: Int = 0

for i in 0..<R { // 세로로 루프 돎.
    var counting = [0, 0, 0] // S(가위), P(보), R(바위)
    for j in 0..<N {
        if friends[j][i] == "S" {
            counting[0] += 1
        }
        else if friends[j][i] == "P" {
            counting[1] += 1
        }
        else if friends[j][i] == "R" {
            counting[2] += 1
        }
    }
    
    var scoreArray: [Int] = []
    // 상근이가 S(가위)를 냈다면,
    scoreArray.append((counting[0] * 1) + (counting[1] * 2) + (counting[2] * 0))
    // 상근이가 P(보)를 냈다면,
    scoreArray.append((counting[0] * 0) + (counting[1] * 1) + (counting[2] * 2))
    // 상근이가 R(바위)를 냈다면,
    scoreArray.append((counting[0] * 2) + (counting[1] * 0) + (counting[2] * 1))
    
    maxScore += scoreArray.max()!
}

print(maxScore)

// MARK: - 2473번(이분탐색)
let N = Int(readLine()!)!
let liquids = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)

var liquidSumDistance: Int = 3000000001 // 세 용액의 합.
var answerIndex1: Int = 0
var answerIndex2: Int = 0
var answerIndex3: Int = 0
outLoop: for i in 0..<N-2 {
    let liq1 = liquids[i] // 첫번째 용액 선택.
    var lowIndex: Int = i + 1
    var highIndex: Int = N - 1

    while lowIndex < highIndex {
        let liq2 = liquids[lowIndex]
        let liq3 = liquids[highIndex]
        
        let sum = liq1 + liq2 + liq3
        if abs(sum) < liquidSumDistance { // 용액의 합(sum)이 0과 더 가깝다면,
            liquidSumDistance = abs(sum)
            (answerIndex1, answerIndex2, answerIndex3) = (i, lowIndex, highIndex)
        }
        
        if sum == 0 { // 더 이상 돌 필요 없이 끝.
            break outLoop
        }
        else if sum > 0 { // 양의 기운이 강한 상태라면, 음쪽으로 가야 함.
            highIndex -= 1
        }
        else { // 음의 기운이 강한 상태라면, 양쪽으로 가야 함.
            lowIndex += 1
        }
    }
}
print(liquids[answerIndex1], liquids[answerIndex2], liquids[answerIndex3])

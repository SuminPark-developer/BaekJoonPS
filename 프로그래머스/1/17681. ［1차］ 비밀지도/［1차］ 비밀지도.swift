func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answerArray: [[String]] = Array(repeating: Array(repeating: "-", count: n), count: n)
    
    var board1: [[String]] = []
    var board2: [[String]] = []
    
    for num in arr1 {
        var translate: [String] = String(num, radix: 2).map{String($0)}  // 10 -> 2진수로 변환 & array전환
        if translate.count < n {
            let needZeroCount = n - translate.count
            translate = Array(repeating: "0", count: needZeroCount) + translate // "0" 부족한 만큼 메꿈.
        }
        board1.append(translate)
    }
    
    for num in arr2 {
        var translate: [String] = String(num, radix: 2).map{String($0)}  // 10 -> 2진수로 변환 & array전환
        if translate.count < n {
            let needZeroCount = n - translate.count
            translate = Array(repeating: "0", count: needZeroCount) + translate // "0" 부족한 만큼 메꿈.
        }
        board2.append(translate)
    }
    
    for y in 0..<n {
        for x in 0..<n {
            if (board1[y][x] == "1") || (board2[y][x] == "1") { // 벽인 경우,
                answerArray[y][x] = "#"
            }
            else {
                answerArray[y][x] = " "
            }
        }
    }
    // print(answerArray)
    var answer: [String] = []
    for line in answerArray {
        answer.append(line.joined(separator: ""))
        // print(line.joined(separator: ""))
    }
    
    return answer
}
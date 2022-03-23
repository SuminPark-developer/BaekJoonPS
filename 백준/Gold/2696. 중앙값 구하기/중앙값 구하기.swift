// MARK: - 2696번
let T = Int(readLine()!)!

for _ in 0..<T {
    let M = Int(readLine()!)!
    var numArray: [Int] = []
    
    if M <= 10 {
        numArray = readLine()!.split(separator: " ").map{Int(String($0))!}
    }
    else { // 11이상이면,
        var line: Int = 0
        if M % 10 == 0 {
            line = M / 10
        }
        else {
            line = M / 10 + 1
        }
        for _ in 0..<line {
            numArray += readLine()!.split(separator: " ").map{Int(String($0))!}
        }
    }
    
    var middleArray: [Int] = []
    var tempArray: [Int] = []
    for i in 0..<M {
        tempArray.append(numArray[i])
        if i % 2 == 0 { // 홀수번째 수일 때,
            tempArray.sort(by: <)
            middleArray.append(tempArray[(i+1)/2])
        }
    }
    
    print(middleArray.count)
    var answer = ""
    for i in 0..<middleArray.count {
        if (i != 0) && (i % 10 == 0) { // 첫번째 값 아니고, 10개씩 출력.
            answer += "\n"
        }
        answer += String(middleArray[i]) + " "
    }
    print(answer)
}

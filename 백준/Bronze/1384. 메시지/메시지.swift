// MARK: - 1384번
var caseCount: Int = 0
while true {
    let n = Int(readLine()!)!
    
    if n == 0 {
        break
    }
    var names: [String] = []
    var badIndex: [[Int]] = []
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map{String($0)}
        names.append(input[0])

        var paperMessages: [String] = []
        for i in 1..<n {
            paperMessages.append(input[i])
        }
        
        var tempArray: [Int] = []
        for (index, ch) in paperMessages.enumerated() {
            if ch == "N" {
                tempArray.append(index)
            }
        }
        badIndex.append(tempArray)
    }

    var answerArray: [String] = []
    for i in 0..<n {
        for index in badIndex[i] {
            answerArray.append("\(names[(i + n - index - 1) % n]) was nasty about \(names[i])")
        }
    }

    caseCount += 1
    print("Group \(caseCount)")
    if answerArray.isEmpty {
        print("Nobody was nasty")
    }
    else {
        for ans in answerArray {
            print(ans)
        }
    }
    print()
}

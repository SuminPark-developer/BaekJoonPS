// MARK: - 10815번(이진 탐색)
let N = Int(readLine()!)!
let sanggeunCards = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
let M = Int(readLine()!)!
let checkCards = readLine()!.split(separator: " ").map{Int(String($0))!}
var answerArray = Array(repeating: "0", count: M)

for (index, card) in checkCards.enumerated() {
    var lowIndex: Int = 0
    var highIndex: Int = N - 1
    
    while lowIndex <= highIndex { // 이진 탐색
        let middleIndex: Int = (lowIndex + highIndex) / 2
        
        if sanggeunCards[middleIndex] == card {
            answerArray[index] = "1"
            break
        }
        
        if sanggeunCards[middleIndex] < card {
            lowIndex = middleIndex + 1
        }
        else {
            highIndex = middleIndex - 1
        }
    }
    
}

print(answerArray.joined(separator: " "))

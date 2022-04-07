// MARK: - 11663번(이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let coords = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)

func findHigh(_ coord: Int) -> Int {
    var lowIndex: Int = 0
    var highIndex: Int = N - 1
    var answerIndex: Int = 0
    
    while lowIndex <= highIndex {
        let middleIndex = (lowIndex + highIndex) / 2
        if coords[middleIndex] <= coord {
            lowIndex = middleIndex + 1
            answerIndex = middleIndex
        }
        else {
            highIndex = middleIndex - 1
        }
    }
    return answerIndex
}

func findLow(_ coord: Int) -> Int {
    var lowIndex: Int = 0
    var highIndex: Int = N - 1
    var answerIndex: Int = 0
    
    while lowIndex <= highIndex {
        let middleIndex = (lowIndex + highIndex) / 2
        if coords[middleIndex] <= coord {
            lowIndex = middleIndex + 1
            answerIndex = middleIndex
        }
        else {
            highIndex = middleIndex - 1
        }
    }
    return answerIndex
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (lowCoord, highCoord) = (input[0], input[1])
    
    let highIndexAnswer = findHigh(highCoord)
    let lowIndexAnswer = findLow(lowCoord)

//    print(lowIndexAnswer, highIndexAnswer)
    
    var count: Int = 0
    if coords[lowIndexAnswer] < lowCoord || coords[highIndexAnswer] > highCoord {
        count = highIndexAnswer - lowIndexAnswer
    }
    else {
        count = highIndexAnswer - lowIndexAnswer + 1
    }
    print(count)
}

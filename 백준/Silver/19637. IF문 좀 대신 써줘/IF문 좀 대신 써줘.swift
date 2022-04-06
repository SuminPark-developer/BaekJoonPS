// MARK: - 2512번(이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var titles: [String] = []
var values: [Int] = []
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{String($0)}
//    if !values.contains(Int(input[1])!) { // (예제2처럼) 중복되는 값은 제외. - 이 부분 필요 없었음. 이유 : 어차피 오름차순으로 들어오고, 같더라도 highIndex가 -1이 되면서 더 최근꺼로 출력하게 되기 때문.
    titles.append(input[0])
    values.append(Int(input[1])!)
//    }
}

for _ in 0..<M {
    let power = Int(readLine()!)!
    var lowIndex: Int = 0
    var highIndex: Int = values.count - 1
    var answerIndex: Int = 0
    
    while lowIndex <= highIndex {
        let middleIndex = (lowIndex + highIndex) / 2
//        print(lowIndex, highIndex, middleIndex)
        
        if power <= values[middleIndex] { // 기준이 더 낮을 때도 포함되는지 확인하기 위해,
            highIndex = middleIndex - 1 // 높은 인덱스를 -1.
            answerIndex = middleIndex
        }
        else { // 기준이 더 높을 때는 포함되는지 확인하기 위해,
            lowIndex = middleIndex + 1 // 낮은 인덱스를 +1.
        }
    }
    print(titles[answerIndex])
}

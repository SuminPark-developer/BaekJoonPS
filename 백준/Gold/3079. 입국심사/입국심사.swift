// MARK: - 3079번(이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var times: [Int] = []

for _ in 0..<N {
    times.append(Int(readLine()!)!)
}
times.sort(by: <)

var lowTime = 1 // 최소 결과 시간
var highTime = times[N - 1] * M // 최대 결과 시간
var answerTime: Int = 0

while lowTime <= highTime {
    let middleTime = (lowTime + highTime) / 2
    
    var sum: Int = 0
    for time in times {
        sum += middleTime / time // x초(middleTime)까지의 시간이 지났을 때, 각 심사대에서 pass한 인원의 합.
    }
    
    if sum >= M { // M명이상이 이미 통과했으면, 더 적은 시간일 때 어떨지 체크를 위해 high를 감소.
        highTime = middleTime - 1
        answerTime = middleTime
    }
    else { // M명이 아직 통과도 못했으면, 더 긴 시간일 때 어떨지 체크를 위해 low를 증가.
        lowTime = middleTime + 1
    }
    
}
print(answerTime)

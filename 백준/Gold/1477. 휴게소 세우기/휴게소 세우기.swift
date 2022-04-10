// MARK: - 1477번(이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, L) = (input[0], input[1], input[2])
let storeCoord: [Int] = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <) + [L] // 휴게소들 좌표 저장. (시작 0, 끝 L)

var low: Int = 1
var high: Int = L - 1
var answerDistance: Int = 0 // 정답

while low <= high {
    let middle = (low + high) / 2 // 기준 거리

    var newStoreCount: Int = 0
    
    for i in 1..<storeCoord.count {
        let distance = storeCoord[i] - storeCoord[i - 1] // 각각의 거리.
        
        newStoreCount += distance / middle // 각각의 거리에서 나올 수 있는 휴게소의 개수.
        
        if distance % middle == 0 { // 만약 나눠떨어지면, 끝부분에 중복설치가 됨.
            newStoreCount -= 1 // 그래서 count값에 -1해줌.
        }
    }

    if newStoreCount <= M { // 개수가 M보다 적으면, 간격을 더 줄여야 함. - M개를 설치했을 때 구간들의 최댓값을 최소로 하려는 거기 때문에, 여기에 등호가 들어감.
        high = middle - 1 // (그래야 개수가 늘어나니깐)
        answerDistance = middle
    }
    else { // 개수가 M보다 많으면, 간격을 더 늘려야 함.
        low = middle + 1 // (그래야 개수가 줄어드니깐)
    }
}
print(answerDistance)

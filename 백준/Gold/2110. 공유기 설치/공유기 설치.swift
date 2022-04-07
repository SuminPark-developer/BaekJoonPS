// MARK: - 2110번(이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, C) = (input[0], input[1])
var houses: [Int] = []
for _ in 0..<N {
    houses.append(Int(readLine()!)!)
}
houses.sort(by: <)

var lowDistance = 1 // 가능한 거리 중, 최소 거리
var highDistance = houses[N - 1] - houses[0] // 가능한 거리 중, 최대 거리
var answer = 0

while lowDistance <= highDistance {
    let middleDstance = (lowDistance + highDistance) / 2 // gap
    
    var count: Int = 1 // 맨 처음에 공유기 설치.
    var base = houses[0]
    for i in 1..<N { // 둘째집부터 돌면서 체크.
        if (base + middleDstance) <= houses[i] { // 다음 집이 (base+설정한gap)에 포함될 때, 공유기 설치.
            count += 1
            base = houses[i]
        }
    }
    
    if count >= C { // 설치된 공유기가 C개 이상이면, gap을 늘려서 더 큰 거리일 때 되는지 체크가 필요. -> gap 늘림.
        lowDistance = middleDstance + 1
        answer = middleDstance
    }
    else { // 설치된 공유기가 C개보다 적다는 건, 더 설치 필요. -> gap 축소.
        highDistance = middleDstance - 1
    }
}

print(answer)

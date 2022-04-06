// MARK: - 1654번(이분탐색)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (K, N) = (input[0], input[1])
var lan: [Int] = [] // 랜선들 모음.
for _ in 0..<K {
    lan.append(Int(readLine()!)!)
}

var low = 1
var high = lan.max()!
var answer: Int = 0

while low <= high {
    let middle = (low + high) / 2
    var countSum: Int = 0 // 생성되는 랜선개수 합
    for l in lan {
        if (l / middle) > 0 {
            countSum += (l / middle)
        }
    }
    if countSum >= N { // 필요한 랜선이 충분하면, 랜선 길이를 더 늘려본다.(최대 길이를 구해야 하기 때문에)
        low = middle + 1
        answer = middle
    }
    else { // 필요한 랜선이 안나오면, 랜선 길이를 줄여본다.
        high = middle - 1
    }
}

print(answer)

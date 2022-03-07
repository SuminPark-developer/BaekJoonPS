// MARK: - 14471번
let JOI = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (JOI[0], JOI[1]) // 2N개의 칸, M장의 카드

var wins: [Int] = [] // 당첨 도장 모음
var loses: [Int] = [] // 꽝 도장 모음
var answer: Int = 0

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    wins.append(input[0])
    loses.append(input[1])
}

wins.sort(by: >) // 내림차순으로 정렬해야 최솟값을 구할 수 있음.
var count = wins.filter{$0 >= N}.count // 기존 입력받은 것들 중, 돈을 내지 않아도 이미 상품수령조건을 만족하는 카드들의 개수.

if count >= M - 1 { // 이미 M-1개 이상의 경품을 얻을 수 있으면,
    answer = 0
}
else {
    for i in count..<wins.count {
        answer += N - wins[i] // 경품 1개 더 얻기 위해 필요한 금액.
        count += 1 // 경품 1개 추가
        
        if count >= M - 1 {
            break
        }
    }
}

print(answer)

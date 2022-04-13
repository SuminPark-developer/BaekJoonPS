// MARK: - 1300번(이분탐색)
let N = Int(readLine()!)!
let k = Int(readLine()!)!
//var A = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
//
//for j in 1..<N+1 {
//    for i in 1..<N+1 {
//        A[j][i] = j * i
//    }
//}
//
//let B = A.flatMap{$0.filter{$0 > 0}}.sorted(by: <)
//print(B[k])

var low: Int = 1
var high: Int = k
var answer: Int = -1
while low <= high {
    let middle = (low + high) / 2
    
    var count: Int = 0
    for i in 1...N {
        count += min(middle / i, N) // (middle/i)와 N 중, 작은 걸 더해야 한다. 예를 들어, 1행(i=1)에서 나올 수 있는 갯수는 최대 N개인데, 더 큰 값이 나올 수도 있기 때문.
    }
    
    if count >= k { // 개수가 K개 이상이면, 더 작은 수일 때도 K개에 해당하는지 찾기 위해 낮춰본다.
        high = middle - 1
        answer = middle
    }
    else { // 개수가 K개보다 아직 적다면, 더 큰 수로 만든다.
        low = middle + 1
    }
}
print(answer)

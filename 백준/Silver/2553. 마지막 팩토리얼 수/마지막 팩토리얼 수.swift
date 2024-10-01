// MARK: - 2553번
//let N = Int(readLine()!)! // 오버플로우
//let answer = String(factorial(N)).map{String($0)}.filter{$0 != "0"}.last!
//print(answer)
//
//func factorial(_ num: Int) -> Int {
//    if num <= 1 {
//        return 1
//    }
//    return (num * factorial(num - 1))
//}

let N = Int(readLine()!)!
var answer: Int = 1
for i in 1...N {
    answer *= i
    answer %= 1000000000 // 큰 수여야 N이 20000일때에 대해 대응됨.
    
    while answer % 10 == 0 {
        answer /= 10
    }
}

print(answer % 10)

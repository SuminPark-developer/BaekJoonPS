// MARK: - 4134번
import Foundation
//var isPrimary = [0] + Array(repeating: 0, count: 4*1000000000) // 에라토스테네스의 체 는 큰 n일때에는 메모리때문에 사용 불가함.
//
//for i in 2...1000 {
//    isPrimary[i] = i
//}
//
//for i in 2...1000 {
//    if isPrimary[i] == 0 {
//        continue
//    }
//    for j in stride(from: i*2, through: 1000, by: i) {
//        isPrimary[j] = 0
//    }
//}
//
//for _ in 0..<T {
//    let n = Int(readLine()!)!
//    let answer: Int = Array(isPrimary[n...1000].filter{$0 != 0}).first!
//    print(answer)
//}
let T = Int(readLine()!)!

func isPrimeNumber(_ num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<Int(sqrt(Double(num)) + 1) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

for _ in 0..<T {
    var n = Int(readLine()!)!
    while !isPrimeNumber(n) {
        n += 1
    }
    print(n)
}

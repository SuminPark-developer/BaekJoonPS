// MARK: - 2581번
import Foundation
let M = Int(readLine()!)!
let N = Int(readLine()!)!

var isPrimeArray = [0] + Array(repeating: 0, count: N)
if N == 1 { // 입력값(최대)이 1이면 바로 종료.
    print(-1)
    exit(0)
}

for i in 2...N {
    isPrimeArray[i] = i
}

for i in 2...N {
    if isPrimeArray[i] == 0 {
        continue
    }
    for j in stride(from: i*2, through: N, by: i) {
        isPrimeArray[j] = 0
    }
}

isPrimeArray = Array(isPrimeArray[M...N])
//print(isPrimeArray)

let sum = isPrimeArray.filter{$0 != 0}.reduce(0, +)
if sum == 0 {
    print(-1)
}
else {
    print(sum)
    let min = isPrimeArray.filter{$0 != 0}.first!
    print(min)
}

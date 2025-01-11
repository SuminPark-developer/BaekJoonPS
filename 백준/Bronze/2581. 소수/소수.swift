// MARK: - 2581번
import Foundation

let M = Int(readLine()!)!
let N = Int(readLine()!)!

var isPrimary = [0] + Array(repeating: 0, count: N)

if N == 1 {
    print(-1)
    exit(0)
}

for i in 2...N {
    isPrimary[i] = i
}

for i in 2...N {
    if isPrimary[i] == 0 {
        continue
    }
    for j in stride(from: i*2, through: N, by: i) {
        isPrimary[j] = 0
    }
}

let sum = Array(isPrimary[M...N]).filter{$0 != 0}.reduce(0, +)
if sum == 0 {
    print(-1)
}
else {
    print(sum)
    let min = Array(isPrimary[M...N]).filter{$0 != 0}.first!
    print(min)
}

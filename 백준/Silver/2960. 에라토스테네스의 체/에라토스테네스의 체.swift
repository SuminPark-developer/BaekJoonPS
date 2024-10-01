// MARK: - 2960번
import Foundation
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, K) = (input[0], input[1])

var primeArray = [0] + Array(repeating: 0, count: N)
for i in 2...N {
    primeArray[i] = i
}

var count: Int = 0
for i in 2...N {
//    print(i, primeArray)
    
    if primeArray[i] == 0 {
        continue
    }
    primeArray[i] = 0
    count += 1
    if count == K {
        print(i)
        exit(0)
    }
    for j in stride(from: i*2, through: N, by: i) {
        if primeArray[j] != 0 {
            primeArray[j] = 0
            count += 1
        }
        if count == K {
            print(j)
            exit(0)
        }
    }
}

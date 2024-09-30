// MARK: - 1978번
import Foundation
let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var count: Int = 0

for num in input {
    if isPrime(num) {
        count += 1
    }
}
print(count)

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    
    let end: Int = Int(sqrt(Double(num)))
    for i in 2...end {
        if num % i == 0 {
            return false
        }
    }
    return true
}

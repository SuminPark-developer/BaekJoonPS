// MARK: - 1747번
import Foundation
var N = Int(readLine()!)!

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2..<Int(sqrt(Double(num)) + 1) {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func isPalindrom(_ num: Int) -> Bool {
    let numArray = String(num).map{String($0)}
    let length = numArray.count
    var flag: Bool = true
    
    for i in 0..<numArray.count/2 {
        if numArray[i] != numArray[length - i - 1] {
            flag = false
            return flag
        }
    }
    return flag
}

while true {
    if isPrime(N) && isPalindrom(N) {
        print(N)
        break
    }
    N = N + 1
}

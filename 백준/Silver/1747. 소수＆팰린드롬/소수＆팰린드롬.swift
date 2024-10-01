// MARK: - 1747번
import Foundation
var N = Int(readLine()!)!

while true {
    if isPrime(N) && isPalindrom(String(N).map{String($0)}) {
        print(N)
        break
    }
    else {
        N += 1
    }
}

func isPrime(_ num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    
    let end = Int(sqrt(Double(num)))
    for i in 2...end {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func isPalindrom(_ numArray: [String]) -> Bool {
    let length = numArray.count
    var flag: Bool = true
    
    for i in 0..<length/2 {
        if numArray[i] != numArray[length - i - 1] {
            flag = false
            break
        }
    }
    return flag
}

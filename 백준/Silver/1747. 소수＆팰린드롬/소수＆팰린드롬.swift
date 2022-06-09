// MARK: - 1747번(에라토스테네스의 체 + 팰린드롬)
import Foundation
var N = Int(readLine()!)!
while true {
    if isPrime(N) { // 소수인데,
        if isPalindrome(String(N).map{String($0)}) { // 팰린드롬이기까지 하면,
            print(N)
            break
        }
    }
    N += 1
}

func isPrime(_ num: Int) -> Bool { // 소수인지 확인하는 함수.
    if num < 4 {
        return num == 1 ? false : true // 1은 false, 2와 3은 true
    }
    let end: Int = Int(sqrt(Double(num))) // Int(√n)까지만.
    for i in 2...end {
        if num % i == 0 { // 약수가 있다면, 소수가 아님.
            return false
        }
    }
    return true
}

func isPalindrome(_ numArray: [String]) -> Bool { // 팰린드롬인지 확인하는 함수.
    let length: Int = numArray.count
    var flag: Bool = true

    for i in 0..<length/2 {
        if numArray[i] != numArray[length - 1 - i] {
            flag = false
            break
        }
    }
    return flag
}

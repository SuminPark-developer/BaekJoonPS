// MARK: - 2407번(DP - 반복문)
import Foundation
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n, m) = (input[0], input[1])
var cache: [[String]] = Array(repeating: Array(repeating: "0", count: m + 1), count: n + 1)

func stringAdd(_ a: String, _ b: String) -> String { // 큰 숫자 더하기.
    var aArray = a.map{String($0)}
    var bArray = b.map{String($0)}
    
    if aArray.count > bArray.count { // b가 무조건 길게.
        swap(&aArray, &bArray)
    }
    
    let len1 = aArray.count
    let len2 = bArray.count
    var answerString: String = ""
    
    var carry: Int = 0 // 올림되는 숫자값
    let diff = len2 - len1
    
    for i in stride(from: len1-1, through: 0, by: -1) {
        let sum: Int = Int(aArray[i])! + Int(bArray[diff + i])! + carry
        answerString += String(UnicodeScalar(sum % 10 + 48)!) // 48이 "0"의 유니코드값.
        carry = sum / 10
    }
    
    for i in stride(from: len2-len1-1, through: 0, by: -1) {
        let sum: Int = Int(bArray[i])! + carry
        answerString += String(UnicodeScalar(sum % 10 + 48)!)
        carry = sum / 10
    }
    
    if carry > 0 {
        answerString += String(UnicodeScalar(carry + 48)!)
    }
    
//    answerString = answerString.reversed().map{String($0)}.joined(separator: "")
    answerString = String(answerString.reversed())
    return answerString
}


for i in 1...n {
    for j in 0...m {
        if j == 0 || j == i {
            cache[i][j] = "1"
        }
        else {
//            cache[i][j] = cache[i - 1][j - 1] + cache[i - 1][j]
            cache[i][j] = stringAdd(cache[i - 1][j - 1], cache[i - 1][j])
        }
    }
}


print(cache[n][m])

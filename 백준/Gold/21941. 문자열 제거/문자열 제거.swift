// MARK: - 21941번(DP - 반복문)
import Foundation
let S: [String] = ["0"] + readLine()!.map{String($0)} // 0은 인덱스 채우기 용.
let M = Int(readLine()!)!
var arr: [(str: String, score: Int)] = []

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{String($0)}
    let (A, X): (String, Int) = (input[0], Int(input[1])!) // 문자열조건, 점수
    arr.append((A, X))
}

var dp: [Int] = Array(repeating: 0, count: S.count)
for i in 0..<dp.count {
    dp[i] = i
}

let sLength: Int = S.count - 1 // 입력받은 S의 진짜 길이.
for i in 1...sLength {
    dp[i] = max(dp[i], dp[i - 1] + 1) // 문자열조건에 해당되는 게 없을 땐 1점만.
    
    let testS: String = S[i...sLength].joined(separator: "") // S의 i부터 끝까지를 String으로 만든 다음, 그 String이 문자열조건(A)로 시작하는지 체크.
    
    for condition in arr { // 조건들(문자열조건(A), 점수)을 돌면서,
        if testS.hasPrefix(condition.str) { // testS가 문자열조건(A)으로 시작한다면,
            dp[(i - 1) + condition.str.count] = max(dp[(i - 1) + condition.str.count], dp[i - 1] + condition.score) // 문자열조건(A)의 길이만큼 인덱스를 옮겨서, max(기존 값, (i - 1)의 dp값 + 조건 점수) 큰 값을 저장한다.
        }
    }
//    print(dp)
}
print(dp.last!)

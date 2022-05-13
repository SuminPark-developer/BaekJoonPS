// MARK: - 9251번(DP - 반복문)
let str1: [String] = [""] + readLine()!.map{String($0)} // 하단 반복문에서 인덱스 맞추기 위해, 미리 맨 앞에 "" 붙임.
let str2: [String] = [""] + readLine()!.map{String($0)}
let (len1, len2) = (str1.count - 1, str2.count - 1)
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: len2 + 1), count: len1 + 1)

for i in 1...len1 {
    for j in 1...len2 {
        if str1[i] == str2[j] { // 문자가 같을 땐,
            dp[i][j] = dp[i - 1][j - 1] + 1
        }
        else { // 문자가 다를 땐,
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        }
    }
}
print(dp[len1][len2])

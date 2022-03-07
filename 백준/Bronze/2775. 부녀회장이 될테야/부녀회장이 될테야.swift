// MARK: - 2775번(2) - 2차원배열
let T = Int(readLine()!)!

for _ in 0..<T {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    var apart: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
    
    for i in 0...k { // 각 층을 돌면서,
        for j in 0...n { // 각 호를 돌면서,
            if i == 0 { // 0층일 땐,
                apart[i][j] = j + 1
            }
            else { // 다른 층일 땐,
                if j == 0 { // 1호일 땐,
                    apart[i][j] = 1
                }
                else { // 2호이상일땐,
                    apart[i][j] = apart[i-1][j] + apart[i][j-1]
                }
            }
            
        }
        
    }
    print(apart[k][n-1])
}

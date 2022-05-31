// MARK: - 18427번(DP - 반복문)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, H) = (input[0], input[1], input[2])
var studentBlocks: [[Int]] = [[0]] // 학생들 블록 저장하는 배열.
for _ in 0..<N {
    studentBlocks.append(readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)) // 오름차순으로 정렬해서 넣어놓음.
}

var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: H + 1), count: N + 1)
for i in 1...N { // 초기 세팅.
    dp[i][0] = 1 // 인덱스 0번째는 1로 채워놓는다.
}

for num in studentBlocks[1] { // 초기 세팅.
    dp[1][num] = 1 // 1번학생이 갖고 있는 블록들과 같은 인덱스들의 값을 1로 채워놓는다.
}

for i in stride(from: 2, through: N, by: 1) { // 2...N으로 하면 1에서 에러남. (그래서 stride로 함.)
    for j in 1...H { // 1번째 열부터 H열까지 돌면서,
        dp[i][j] = dp[i - 1][j] % 10007 // 우선 이전 행 dp값 저장.
        
        for num in studentBlocks[i] { // i번째 학생이 갖고 있는 블록들 중,
            if j - num >= 0 { // 인덱스를 벗어나지 않을 때에만,
                dp[i][j] += (dp[i - 1][j - num]) % 10007 // 이전 행의 (j-num)열 값들을 더함.
            }
        }
    }
}
print(dp[N][H] % 10007)

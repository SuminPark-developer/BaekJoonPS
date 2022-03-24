// 백준 - 2583번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (M, N, K) = (input[0], input[1], input[2])
var board: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: M)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: M)

var point = [[Int]]()
for _ in 0..<K {
    point.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 0..<K {
    for x in point[i][0]..<point[i][2] {
        for y in point[i][1]..<point[i][3] {
            board[y][x] = true
        }
    }
}

let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]
var count: Int = 0

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < M) && (0 <= x && x < N)
}

func dfs(_ y: Int, _ x: Int) {
    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]
        
        if isValidCoord(ny, nx) && visited[ny][nx] == false && board[ny][nx] == false {
            visited[ny][nx] = true
            count += 1
            dfs(ny, nx)
        }
    }
}

var answer = [Int]()

for i in 0..<M {
    for j in 0..<N {
        if visited[i][j] == false && board[i][j] == false { // board[i][j]가 false인 곳을 찾는거임.(즉, 사각형이 아닌 부분)
            visited[i][j] = true
            count = 1
            dfs(i, j)
            answer.append(count)
        }
    }
}

print(answer.count)
answer.sort()
var resultString: String = ""
for i in answer {
    resultString += "\(i) "
}
print(resultString)

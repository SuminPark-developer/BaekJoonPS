// 백준 - 1743번(DFS 사용)
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M, K) = (input[0], input[1], input[2])

var graph: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)

for _ in 0..<K {
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]-1][input[1]-1] = true
}

var dy = [0, 1, 0, -1]
var dx = [1, 0, -1, 0]
var count: Int = 0
var answer: Int = 0

func isValidCoord(_ y: Int, _ x: Int) -> Bool { // graph밖으로 나가지 않아야 true.
    return (0 <= y && y < N) && (0 <= x && x < M)
}

func dfs(_ y: Int, _ x: Int) {
    for k in 0..<4 {
        let ny = y + dy[k]
        let nx = x + dx[k]

        if isValidCoord(ny, nx) && visited[ny][nx] == false && graph[ny][nx] == true {
            visited[ny][nx] = true
            count += 1
            dfs(ny, nx)
        }

    }
}

for i in 0..<N {
    for j in 0..<M {
        if visited[i][j] == false && graph[i][j] == true {
            visited[i][j] = true
            count = 1 // 바로 윗줄에서 visited[i][j]가 true가 되면서 음식물 크기1부터 시작함.
            dfs(i, j)
            if count > answer {
                answer = count
            }
        }
    }
}

print(answer)

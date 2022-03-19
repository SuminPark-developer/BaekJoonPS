// MARK: - 11724번(DFS)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var adj = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)
var check = Array(repeating: false, count: N + 1) // 방문체크
var answer: Int = 0

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (u, v) = (input[0], input[1])
    adj[u][v] = true
    adj[v][u] = true
}

func dfs(_ index: Int) {
    for next in 1...N {
        if (index != next) && (adj[index][next] == true) && (check[next] == false) { // 자기자신X, 연결되어 있고, 방문한 적 없으면,
            check[next] = true
            dfs(next)
        }
    }
    
}

for i in 1...N {
    if check[i] == false {
        check[i] = true
        answer += 1
        dfs(i)
    }
    
}

print(answer)

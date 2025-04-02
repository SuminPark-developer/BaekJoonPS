// MARK: - 11725번(DFS, 인접행렬)
let N = Int(readLine()!)!
//var board: [[Int]] = Array(repeating: Array(repeating: 0, count: N + 1), count: N + 1)
var adj: [[Int]] = Array(repeating: [], count: N + 1) // 인접행렬
var parents = Array(repeating: -1, count: N + 1) // -1이면 미방문

for _ in 0..<N-1 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (y, x) = (input[0], input[1])
    adj[y].append(x)
    adj[x].append(y)
}

func dfs(_ index: Int, _ p: Int) {
    parents[index] = p
    
    for next in adj[index] {
        if parents[next] == -1 { // 미방문 시
            dfs(next, index)
        }
    }
}

dfs(1, 0)
for parent in parents[2...] {
    print(parent)
}

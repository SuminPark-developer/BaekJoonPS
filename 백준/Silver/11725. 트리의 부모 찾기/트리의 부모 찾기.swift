// MARK: - 11725번(DFS) // 참고 : https://t.ly/fvs-T
let N = Int(readLine()!)!
var adj: [[Int]] = Array(repeating: [], count: N + 1) // 인접행렬

for _ in 0..<N-1 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a, b) = (input[0], input[1])
    
    adj[a].append(b)
    adj[b].append(a)
}

var parents: [Int] = Array(repeating: -1, count: N + 1) // -1은 미방문.

func dfs(_ index: Int, _ p: Int) {
    parents[index] = p
//    print(parents)
    
    for next in adj[index] {
        if parents[next] == -1 {
            dfs(next, index)
        }
    }
}

dfs(1, 0)

for parent in parents[2...] {
    print(parent)
}

// 백준 - 2606번(인접리스트 - dfs | 참고 : https://www.acmicpc.net/source/31892377)
let N = Int(readLine()!)! // 컴퓨터의 수
let M = Int(readLine()!)! // 컴퓨터 쌍의 수

var adj: [[Int]] = Array(repeating: [], count: N+1) // 인접리스트
var visited: [Bool] = Array(repeating: false, count: N+1) // 방문 체크
var answer: Int = 0

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let(a, b) = (input[0], input[1])
    
    adj[a].append(b)
    adj[b].append(a)
    
}

func dfs(_ index: Int) {
    for next in adj[index] {
        if index != next && visited[next] == false {
            visited[next] = true
            answer += 1
            dfs(next)
        }
    }
}

visited[1] = true
dfs(1)

print(answer)

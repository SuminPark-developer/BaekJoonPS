// MARK: - 1939번(BFS + 이분체크)
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var graph: [[(Int, Int)]] = Array(repeating: [], count: N + 1)
var visited = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (A, B, C) = (input[0], input[1], input[2])
    graph[A].append((B, C))
    graph[B].append((A, C))
}
let fromTo = readLine()!.split(separator: " ").map{Int(String($0))!}
let (startX, endX) = (fromTo[0], fromTo[1])

func isEscape(_ island: Int) -> Bool { // 섬번호가 목표지점에 도달하면 탈출.
    return island == endX
}

func bfs(_ startIsland: Int, _ standardWeight: Int) -> Bool {
    var q: [Int] = [startIsland]
    visited[startIsland] = true
    
    while !q.isEmpty {
        let islandNumber = q.removeFirst()
        
        if isEscape(islandNumber) { // 탈출 성공 시,
            return true // middle(기준)중량으로 운송 가능.
        }
        
        for (nextIsland, limitWeight) in graph[islandNumber] {
            if limitWeight >= standardWeight && !visited[nextIsland] { // 다음섬과 연결된 다리의 중량제한이 middle(기준)중량 이상일 때에만 다음 섬으로 이동 가능. + 미방문시,
                visited[nextIsland] = true
                q.append(nextIsland)
            }
        }
        
        
    }
    return false
}



var low: Int = 1
var high: Int = 1000000001
var answer: Int = 0
while low <= high {
    visited = Array(repeating: false, count: N + 1) // 매 middle(기준)중량일 때, 방문배열 초기화해줘야 함.
    let middle = (low + high) / 2
    
    if bfs(startX, middle) { // 지금 middle(기준) 중량이 운송 가능하다면, 더 높은 중량에서 가능한지 체크하기 위해 low를 높여본다.
        low = middle + 1
        answer = middle
    }
    else { // middle(기준) 중량으로 운송 불가능하다면, 낮춰야 함.
        high = middle - 1
    }
}

print(answer)

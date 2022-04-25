// MARK: - 1890번(DFS, DP - topDown)
let N = Int(readLine()!)!
var map: [[Int]] = Array(repeating: [], count: N)
var cache = Array(repeating: Array(repeating: -1, count: N), count: N)

for i in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[i] = input
}

func isValidCoord(_ y: Int, _ x: Int) -> Bool {
    return (0 <= y && y < N) && (0 <= x && x < N)
}


func dfs(_ y: Int, _ x: Int) -> Int { // topDown
    
    if y == N - 1 && x == N - 1 {
        return 1
    }
    else if cache[y][x] == -1 {
        cache[y][x] = 0
        
        let ny = y + map[y][x]
        let nx = x + map[y][x]
        
        if isValidCoord(ny, x) { // 1. 밑으로 갈 때,
            cache[y][x] += dfs(ny, x)
        }
        if isValidCoord(y, nx) { // 2. 우측으로 갈 때,
            cache[y][x] += dfs(y, nx)
        }
    }
    
    return cache[y][x]
}

let answer = dfs(0, 0)
//print(cache)
print(answer)

// 백준 - 5427번(bfs 2개 사용 - 포인터 사용)
let testCase = Int(readLine()!)!

var board = [[Character]]()
var fireVisited = [[Int]]()
var visited = [[Int]]()

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]
var w: Int = 0
var h: Int = 0

var fireQueue: [(Int, Int)] = [(Int, Int)]()
var myFireQueue = [(Int, Int)]()
var queue: [(Int, Int)] = [(Int, Int)]()
var myQueue = [(Int, Int)]()

func fireBfs() {
    var cur = 0
    while cur < myFireQueue.count {
        let (y, x) = myFireQueue[cur]
        cur += 1

        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]

            if ny < 0 || ny >= h || nx < 0 || nx >= w { // 범위 벗어나면,
                continue
            }

            if fireVisited[ny][nx] != -1 || board[ny][nx] == "#" { // 불이 이미 방문했거나 or 벽이면,
                continue
            }

            myFireQueue.append((ny, nx))
            fireVisited[ny][nx] = fireVisited[y][x] + 1
        }
    }
}

func bfs(_ sy: Int, _ sx: Int) {
    var escape: Bool = false // 탈출 여부
    var cur = 0
    myQueue.append((sy, sx)) // 사람 위치
    visited[sy][sx] = 0 // 사람 지나간 표시

    findResultLoop: while cur < myQueue.count {
        let (y, x) = myQueue[cur]
        cur += 1

        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]

            if ny < 0 || ny >= h || nx < 0 || nx >= w { // 사람이 (0,0) ~ (h-1,w-1)의 범위를 벗어난다면 탈출.
                print(visited[y][x] + 1)
                escape = true // 탈출 성공
                break findResultLoop
            }

            if (visited[ny][nx] != -1) || (board[ny][nx] == "#") { // 이미 방문한적 있거나, 벽이면
                continue
            }
            if (fireVisited[ny][nx] != -1) && (fireVisited[ny][nx] <= visited[y][x] + 1) { // 불이 이미 방문했었고 + 그 불이 사람이 이동하기 전에 방문했다면, (사람이 이동한 뒤 확산되면 문제 X)
                continue
            }
            myQueue.append((ny, nx))
            visited[ny][nx] = visited[y][x] + 1
        }
    }

    if escape == false {
        print("IMPOSSIBLE")
    }

}


var personStartY: Int = 0
var personStartX: Int = 0

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    (w, h) = (input[0], input[1])

    var boardTemp: [[Character]] = Array(repeating: Array(repeating: "-", count: w), count: h)
    let visitedTemp: [[Int]] = Array(repeating: Array(repeating: -1, count: w), count: h)
    visited = visitedTemp
    fireVisited = visitedTemp

    for i in 0..<h {
        let str = readLine()!.map{$0}
        for j in 0..<w {
            boardTemp[i][j] = str[j]
            if boardTemp[i][j] == "*" { // 불 시작 위치(불은 여러개일 수 있음...!)
                fireVisited[i][j] = 0
                myFireQueue.append((i, j))
            }
            else if boardTemp[i][j] == "@" { // 사람 시작 위치
                personStartY = i
                personStartX = j
            }
        }
    }
    board = boardTemp
    fireBfs() // 불 bfs 먼저,
    bfs(personStartY, personStartX) // 사람 bfs 진행.

    fireQueue = [(Int, Int)]() // 다음을 위해 초기화
//    fireQueue.removeAll() // 새로 선언하는것보다 지우는게 시간이 더 걸릴 것 같아서.
    myFireQueue = fireQueue

    queue = [(Int, Int)]() // 다음을 위해 초기화
//    queue.removeAll()
    myQueue = queue
}

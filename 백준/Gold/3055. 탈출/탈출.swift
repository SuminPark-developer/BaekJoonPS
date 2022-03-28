// 백준 - 3055번(bfs 2개 사용 - 큐)
class Queue<T> {
    var enQueue: [(T, T)]
    var deQueue: [(T, T)] = []

    var count: Int {
        return enQueue.count + deQueue.count
    }

    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }

    init(_ queue: [(T, T)]) {
        self.enQueue = queue
    }

    func push(_ element: (T, T)) {
        enQueue.append(element)
    }

    func pop() -> (T, T) {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }

}

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (R, C) = (input[0], input[1])

let dy = [0, 1, 0, -1]
let dx = [1, 0, -1, 0]

var board: [[Character]] = Array(repeating: Array(repeating: "-", count: C), count: R)

var waterQueue: [(Int, Int)] = [(Int, Int)]()
var myWaterQueue: Queue = Queue<Int>(waterQueue) // 물 큐
var dochiQueue: [(Int, Int)] = [(Int, Int)]()
var myDochiQueue: Queue = Queue<Int>(dochiQueue) // 고슴도치 큐

var waterVisited = Array(repeating: Array(repeating: -1, count: C), count: R)
var dochiVisited = Array(repeating: Array(repeating: -1, count: C), count: R)

var escape: Bool = false // 탈출 여부

func waterBfs() {
    
    while !myWaterQueue.isEmpty {
        let (y, x) = myWaterQueue.pop()
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if ny < 0 || ny >= R || nx < 0 || nx >= C {
                continue
            }
            
            if waterVisited[ny][nx] != -1 || board[ny][nx] == "X" || board[ny][nx] == "D" { // 물이 이미 방문했거나 or 돌이거나 or 비버의 굴(도착지)이라면,
                continue
            }
            
            myWaterQueue.push((ny, nx))
            waterVisited[ny][nx] = waterVisited[y][x] + 1
        }
        
    }
}

func dochiBfs() -> Bool {

    while !myDochiQueue.isEmpty {
        let (y, x) = myDochiQueue.pop()
        
        if board[y][x] == "D" { // 비버의 굴(도착지)에 도착하면,
            print(dochiVisited[y][x])
            return true // 탈출 성공
        }
        
        for k in 0..<4 {
            let ny = y + dy[k]
            let nx = x + dx[k]
            
            if ny < 0 || ny >= R || nx < 0 || nx >= C { // 범위 벗어나면,
                continue
            }
            
            if dochiVisited[ny][nx] != -1 || board[ny][nx] == "X" { // 이미 방문한적 있거나 or 돌이라면,
                continue
            }
            if (waterVisited[ny][nx] != -1) && (waterVisited[ny][nx] <= dochiVisited[y][x] + 1) { // 물이 이미 방문했었고 + 그 물이 도치가 이동하기 전에 방문했다면, ( 도치가 이동한 뒤 확산돼도 문제 O)
                continue
            }
            
            myDochiQueue.push((ny, nx))
            dochiVisited[ny][nx] = dochiVisited[y][x] + 1
        }
        
    }
    return false // 탈출 실패
}

for i in 0..<R {
    let str = readLine()!.map{$0}
    for j in 0..<C {
        board[i][j] = str[j]
        
        if board[i][j] == "*" { // 물은 여러개일 수 있음.
            waterVisited[i][j] = 0
            myWaterQueue.push((i, j))
        }
        if board[i][j] == "S" {
            dochiVisited[i][j] = 0
            myDochiQueue.push((i, j))
        }
    }
}

waterBfs()
escape = dochiBfs()
if escape == false {
    print("KAKTUS")
}

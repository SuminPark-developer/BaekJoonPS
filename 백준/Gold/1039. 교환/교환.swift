// MARK: - 1039번(BFS)
let input = readLine()!.split(separator: " ").map{String($0)}
let (N, K) = (input[0].map{String($0)}, Int(input[1])!)
var visited = Array(repeating: Array(repeating: false, count: 1000001), count: 11) // 각 depth일 때의 방문체크가 필요함.
//var maxAnswer: Int = 0
var answerArray: [Int] = [] // depth가 K번째일 때의 정답숫자들 모음.

func bfs(_ startX: [String]) {
    var q: [([String], Int)] = [(startX, 0)]
    var index: Int = 0
    
    while index < q.count {
        let (x, d) = q[index]
        
        index += 1 // 그 depth에 해당하는 값들을 비교해야 하기 때문에, index증가부분이 밑이 아니라 여기있어야 함.
        
        if d == K { // K번째일 때,
            answerArray.append(Int(x.reduce("", +))!)
//            maxAnswer = max(maxAnswer, Int(x.reduce("", +))!)
            continue // d가 K번째일 때꺼까지만 필요하고, 더 이상 진행하면 X.
        }
        
        for i in 0..<N.count {
            for j in i+1..<N.count {
                var swapTemp: [String] = x // x의 스왑을 위한 임시변수.
                swapTemp.swapAt(i, j)
                let swapNum = Int(swapTemp.reduce("", +))!
                if swapTemp[0] != "0" && !visited[d][swapNum] {
                    visited[d][swapNum] = true
                    q.append((swapTemp, d + 1))
                }
                
            }
        }
    }
}

bfs(N)

answerArray.isEmpty ? print("-1") : print(answerArray.max()!)

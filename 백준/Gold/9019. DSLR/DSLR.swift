// MARK: - 9019번(BFS) - 시간초과 개선
let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (A, B) = (input[0], input[1])
    var visited = Array(repeating: false, count: 10000)
    
    func bfs(_ startX: Int) -> String {
        var q: [(Int, Int)] = [(startX, 0)] // (Int, String)으로 하면 시간초과.
        visited[startX] = true
        var index: Int = 0
        var answer: String = ""
        
        while index < q.count {
            let (x, d) = q[index] // d는 원래는 String으로 이어붙이는 식으로 했었는데, 그렇게 하면 시간초과나서 Int로 계산해주고, 마지막에 이어붙이는 식으로 함.
            
            if x == B { // B에 도달하면,
                for ch in String(d) {
                    switch ch {
                    case "1":
                        answer += "D"
                    case "2":
                        answer += "S"
                    case "3":
                        answer += "L"
                    case "4":
                        answer += "R"
                    default:
                        break
                    }
                }
                return answer // 명령어(answer) 반환.
            }
            
            if x*2 > 9999 { // D일 때, - 9999보다 큰 경우.
                let temp = x*2 % 10000
                if !visited[temp] {
                    visited[temp] = true
                    q.append((temp, d * 10 + 1))
                }
            }
            else { // D일 때, - 9999이하인 경우.
                if !visited[x*2] {
                    visited[x*2] = true
                    q.append((x*2, d * 10 + 1))
                }
            }
            
            if x == 0 { // S일 때, - n이 0인 경우. ( x-1이 0일때가 아니라, x가 0일 때임.)
                let temp = 9999
                if !visited[temp] {
                    visited[temp] = true
                    q.append((temp, d * 10 + 2))
                }
            }
            else { // S일 때, - n이 0이 아닌 경우.
                if !visited[x-1] {
                    visited[x-1] = true
                    q.append((x-1, d * 10 + 2))
                }
            }
            
            // L 부분.
            let lFront = x % 1000
            let lBack = x / 1000
            let lNum = (lFront * 10) + lBack // L을 사용시 나오는 숫자.
            if !visited[lNum] {
                visited[lNum] = true
                q.append((lNum, d * 10 + 3))
            }
            
            // R 부분.
            let rFront = x % 10
            let rBack = x / 10
            let rNum = (rFront * 1000) + rBack // R을 사용시 나오는 숫자.
            if !visited[rNum] {
                visited[rNum] = true
                q.append((rNum, d * 10 + 4))
            }
            index += 1
        }
        return "no" // 여기 오는 일은 없음.
    }
    
    let answer = bfs(A)
    print(answer)
}

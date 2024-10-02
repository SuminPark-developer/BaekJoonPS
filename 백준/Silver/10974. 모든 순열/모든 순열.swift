// 백준 - 10974번(백트래킹 - https://velog.io/@grap_ios/%EB%B0%B1%EC%A4%80-10974%EB%B2%88-%EB%AA%A8%EB%93%A0%EC%88%9C%EC%97%B4)
let N = Int(readLine()!)!
var result: [String] = [String](repeating: " ", count: N)
var visited: [Bool] = [Bool](repeating: false, count: N)

func permutation(_ depth: Int) {
    if depth == N {
        print(result.joined(separator: " "))
        return
    }
    
    for i in 0..<N {
        if visited[i] == true {
            continue
        }
        visited[i] = true
        result[depth] = "\(i+1)"
        permutation(depth + 1)
        visited[i] = false
    }
    
}

permutation(0)


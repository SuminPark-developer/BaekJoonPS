// MARK: - 14659번
let N = Int(readLine()!)!
let mountain = readLine()!.split(separator: " ").map{Int(String($0))!}
var killArray: [Int] = []

for i in 0..<N {
    var kill: Int = 0 // 킬 수
    let standard: Int = mountain[i] // 기준 봉우리
    
    if i == N - 1 { // 마지막 봉우리일 땐,
        killArray.append(0) // 0킬
        break
    }
    else {
        for j in i+1..<N {
            if mountain[j] > standard { // (기준 봉우리보다) 다음 봉우리가 더 높으면 끝.
                break
            }
            kill += 1 // 다음 봉우리가 더 높지 않으면,
        }
        killArray.append(kill)
    }
}

print(killArray.max()!)

// MARK: - 14720번
let N = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let milk = [0, 1, 2] // 딸기우유, 초코우유, 바나나우유
var j: Int = 0
var count: Int = 0


for i in 0..<N {
    if input[i] == milk[j] {
        if j == 2 { // milk의 끝에 도달했으면,
            j = 0 // 첫행으로 이동.
        }
        else { // milk의 끝이 아니면,
            j += 1 // 다음행으로 이동.
        }
        count += 1
    }
    
}

print(count)

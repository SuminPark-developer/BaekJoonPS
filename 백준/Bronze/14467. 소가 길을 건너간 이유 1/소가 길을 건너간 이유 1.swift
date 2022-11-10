// MARK: - 14467번
let N = Int(readLine()!)!
var answer: Int = 0
var cows: [Int] = [-2] + Array(repeating: -1, count: 10)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (num, location) = (input[0], input[1])
    
//    if cows[num] == -1 { // 첫 등장이면,
//        cows[num] = location
//    }
//    else {
//        if cows[num] != location { // 위치가 달라졌다면,
//            answer += 1
//            cows[num] = location
//        }
//    }
    
    if cows[num] != -1 && cows[num] != location { // 첫 등장이 아니고 + 위치가 달라졌으면,
        answer += 1
    }
    cows[num] = location
    
}
print(answer)

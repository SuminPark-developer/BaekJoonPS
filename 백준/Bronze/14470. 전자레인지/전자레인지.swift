// MARK: - 14470번
let A = Int(readLine()!)!
let B = Int(readLine()!)!
let C = Int(readLine()!)!
let D = Int(readLine()!)!
let E = Int(readLine()!)!

var time: Int = 0

if A < 0 { // 고기가 얼어 있다면,
    time += D + (abs(A) * C) + (B * E) // 해동 + 0도까지 올리는 데 걸리는 시간 + 목표 온도(B도)까지 올리는 데 걸리는 시간.
}
else { // 고기가 녹아 있다면,
    time += (B - A) * E // 목표 온도(B도)까지 올리는 데 걸리는 시간.
}

print(time)

// MARK: - 22864번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (A, B, C, M) = (input[0], input[1], input[2], input[3])

var (tired, worked) = (0, 0)

for _ in 1...24 {
    if (tired + A) <= M { // 일 가능
        tired += A
        worked += B
    }
    else { // 일 불가능
        tired -= C
        if tired < 0 { tired = 0 } // 단, 피로도가 음수가 될 순 없음.
    }
}

print(worked)

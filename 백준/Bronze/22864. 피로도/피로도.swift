// MARK: - 22864번
import Foundation
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (A, B, C, M) = (input[0], input[1], input[2], input[3])

var (tired, work) = (0, 0)

if A > M {
    print(0)
    exit(0)
}

for _ in 1...24 {
//    print(i, tired, work)
    if (tired + A) <= M {
        tired += A
        work += B
    }
    else {
        if tired - C >= 0 {
            tired -= C
        }
        else {
            tired = 0
        }
    }
}
print(work)

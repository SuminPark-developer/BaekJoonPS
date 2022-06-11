// MARK: - 10942번(dp + 팰린드롬)
import Foundation
// 라이노님의 FileIO
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

// 풀이
let file = FileIO()
//let N = Int(readLine()!)!
let N = file.readInt()
//var arr: [Int] = [-1] + readLine()!.split(separator: " ").map{Int(String($0))!}
var arr: [Int] = [-1]
for _ in 0..<N {
    arr.append(file.readInt())
}
//let M = Int(readLine()!)!
let M = file.readInt()
//var question: [(start: Int, end: Int)] = []
//for _ in 0..<M {
//    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
//    question.append((input[0], input[1]))
//}
var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: N + 1), count: N + 1)

for i in 1...N {
    dp[i][i] = true // 1자리수는 무조건 팰린드롬.
}

for i in 1..<N {
    if arr[i] == arr[i + 1] { // dp공식을 위해 미리 체크해놓음.
        dp[i][i + 1] = true
    }
}

for i in stride(from: N-2, through: 1, by: -1) {
    for j in i+2...N { // i와 i+1은 미리 세팅됨.
        if (dp[i + 1][j - 1]) && (arr[i] == arr[j]) {
            dp[i][j] = true
        }
    }
}

//for q in question {
//    if dp[q.start][q.end] { // 팰린드롬인 경우,
//        print(1)
//    }
//    else { // 팰린드롬이 아닐 경우,
//        print(0)
//    }
//}

var answer = ""
for _ in 0..<M {
    let (S, E) = (file.readInt(), file.readInt())
    answer += (dp[S][E] == true ? "1\n" : "0\n")
}
print(answer)
// 백준 - 2439번(2)
let N = Int(readLine()!)!
for i in 1...N {
    for _ in 0..<N-i {
        print(" ", terminator: "")
    }
    for _ in 0..<i {
        print("*", terminator: "")
    }
    print()
}

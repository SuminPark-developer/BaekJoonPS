// MARK: - 11653번
var N = Int(readLine()!)!

for i in stride(from: 2, to: N, by: 1) {
    while N % i == 0 { // i로 계속 나눠줌.
        N = N / i
        print(i)
    }
}

if N != 1 { // 맨 마지막이 소수라면 출력해줘야 함. ex) 7
    print(N)
}

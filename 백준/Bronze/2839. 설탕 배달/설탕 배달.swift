// 백준 - 2839번
var N = Int(readLine()!)!
var result: Int = 0


if N % 5 == 0 {
    result = N / 5
}
else {
    checkCount: while N > 0 {
        N -= 3
        result += 1
        
        if N % 5 == 0 {
            result += N / 5
            break checkCount
        }
        
    }
    
    if N < 0 {
        result = -1
    }
    
}

print(result)
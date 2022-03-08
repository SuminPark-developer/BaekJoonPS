// 백준 - 10872번
let N = Int(readLine()!)!

func factorial(_ n: Int) -> Int {
    
    if n <= 1 {
        return 1
    }
    
    return n * factorial(n - 1)
    
}

print(factorial(N))

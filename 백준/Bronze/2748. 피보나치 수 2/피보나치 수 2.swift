// MARK: - 2747번(시간초과 개선)
let N = Int(readLine()!)!

func fibo(_ n: Int) -> Int {
    var fiboArray = [0, 1, 1]
    
    if n >= 3 {
        for i in 3...n {
            fiboArray.append(fiboArray[i-1] + fiboArray[i-2])
        }
    }

    return fiboArray[n]
}

let answer = fibo(N)
print(answer)

// MARK: - 2167번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])

var numArray = Array(repeating: Array(repeating: 0, count: M + 1), count: N + 1)

for i in 1...N { // N행
    let numsInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    for j in 1...M { // M열
        numArray[i][j] = numsInput[j-1]
    }

}

let k = Int(readLine()!)!

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var sum: Int = 0
    
    for i in input[0]...input[2] {
        for j in input[1]...input[3] {
            sum += numArray[i][j]
        }
    }
    print(sum)
}

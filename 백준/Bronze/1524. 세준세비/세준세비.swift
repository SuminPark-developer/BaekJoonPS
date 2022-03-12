// MARK: - 1524번
let T = Int(readLine()!)!

for _ in 0..<T {
    readLine()
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (_, _) = (input[0], input[1]) // N, M
    let sejun = readLine()!.split(separator: " ").map{Int(String($0))!}
    let sebi = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let maxSejun = sejun.max()! // 힘은 바뀌지 않고,
    let maxSebi = sebi.max()! // 제일 센 병사 1개만 있어도 됨.
    
    if maxSejun >= maxSebi {
        print("S")
    }
    else {
        print("B")
    }
    
}

// MARK: - 10162번
let T = Int(readLine()!)!

if T % 10 != 0 {
    print("-1")
}
else {
    let A = T / 300
    let B = (T % 300) / 60
    let C = ((T % 300) % 60) / 10
    
    print(A, B, C)
    
}

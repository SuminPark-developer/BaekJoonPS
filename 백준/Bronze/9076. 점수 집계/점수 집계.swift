// MARK: - 9076번
let T = Int(readLine()!)!

for _ in 0..<T {
    var score = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
    score.removeFirst()
    score.removeLast()
    
    if score.last! - score.first! >= 4 {
        print("KIN")
    }
    else {
        print(score.reduce(0, +))
    }
    
}

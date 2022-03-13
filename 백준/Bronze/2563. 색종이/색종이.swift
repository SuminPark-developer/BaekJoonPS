// MARK: - 2563번
let N = Int(readLine()!)!
var paper = Array(repeating: Array(repeating: 0, count: 101), count: 101)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x, y) = (input[0], input[1])
    
    for i in y..<y+10 {
        for j in x..<x+10 {
            paper[i][j] = 1
        }
    }
    
}

print(paper.flatMap{$0}.filter{$0 == 1}.count)

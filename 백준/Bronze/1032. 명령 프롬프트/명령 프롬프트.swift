// MARK: - 1032번
let N = Int(readLine()!)!
var standard: [String] = []

for i in 0..<N {
    let input = readLine()!.map{String($0)}
    
    if i == 0 {
        standard = input
        continue
    }
    
    for (index, ch) in input.enumerated() {
        if standard[index] != ch {
            standard[index] = "?"
        }
    }
    
}

print(standard.reduce("", +))

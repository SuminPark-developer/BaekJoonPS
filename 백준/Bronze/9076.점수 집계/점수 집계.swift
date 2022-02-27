// MARK: - 9076번
let T = Int(readLine()!)!

for _ in 0..<T {
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    input.sort(by: <)
    input.remove(at: 4)
    input.remove(at: 0)
    
    if input.last! - input.first! >= 4 {
        print("KIN")
    }
    else {
        let sum: Int = input.reduce(0, +)
        print(sum)
    }
    
}

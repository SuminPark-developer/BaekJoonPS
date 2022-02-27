// MARK: - 19604번
let N = Int(readLine()!)!
var arrayX: [Int] = []
var arrayY: [Int] = []


for _ in 0..<N {
    let input = readLine()!.split(separator: ",").map{Int(String($0))!}
    arrayX.append(input[0])
    arrayY.append(input[1])
}

print("\(arrayX.min()! - 1),\(arrayY.min()! - 1)")
print("\(arrayX.max()! + 1),\(arrayY.max()! + 1)")

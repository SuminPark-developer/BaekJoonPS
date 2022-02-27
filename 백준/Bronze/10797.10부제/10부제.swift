// MARK: - 10797번
let input = Int(readLine()!)!
let numArray = readLine()!.split(separator: " ").map{Int(String($0))!}
var count: Int = 0

for num in numArray {
    if input == num {
        count += 1
    }
}

print(count)

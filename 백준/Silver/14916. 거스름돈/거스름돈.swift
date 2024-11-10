// MARK: - 14916번(개선)
let input = Int(readLine()!)!
var coin = 0

let maxCount = input / 5
for i in stride(from: maxCount, through: 0, by: -1) {
    if (input - (i * 5)) % 2 == 0 {
        coin = i + (input - (i * 5)) / 2
        break
    }
}

print(coin == 0 ? -1 : coin)

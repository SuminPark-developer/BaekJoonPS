// MARK: - 14623번
let B1 = readLine()!
let B2 = readLine()!
let decB1 = Int(B1, radix: 2)!
let decB2 = Int(B2, radix: 2)!

let temp = decB1 * decB2
let answer = String(temp, radix: 2)
print(answer)

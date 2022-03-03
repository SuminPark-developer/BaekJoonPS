// MARK: - 2720번
let T = Int(readLine()!)!

for _ in 0..<T {
    let input = Int(readLine()!)!
    
    let quarter = input / 25
    let dime = (input % 25) / 10
    let nickel = ((input % 25) % 10) / 5
    let penny = (((input % 25) % 10) % 5) / 1
    
    print(quarter, dime, nickel, penny)
    
}

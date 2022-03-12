// MARK: - 1526번
let N = Int(readLine()!)!

for num in stride(from: N, through: 4, by: -1) {
    let strNum = String(num)
    
    if strNum.contains("0") || strNum.contains("1") || strNum.contains("2") || strNum.contains("3") || strNum.contains("5") || strNum.contains("6") || strNum.contains("8") || strNum.contains("9"){
        continue
    }
    else {
        print(num)
        break
    }
    
}

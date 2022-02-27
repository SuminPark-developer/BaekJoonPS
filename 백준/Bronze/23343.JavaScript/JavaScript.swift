// MARK: - 23343번
let input = readLine()!.split(separator: " ").map{String($0)}
let (x, y) = (input[0], input[1])

var checkX: Bool = false
var checkY: Bool = false

if Int(x) != nil { // 숫자로 바꿀 수 있으면,
    checkX = true
}

if Int(y) != nil { // 숫자로 바꿀 수 있으면,
    checkY = true
}

if checkX == true && checkY == true { // 둘 다 숫자로 바꿀 수 있으면,
    print(Int(x)! - Int(y)!)
}
else {
    print("NaN")
}

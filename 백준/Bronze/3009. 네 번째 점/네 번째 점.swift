// MARK: - 3009번
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (x1, y1) = (input[0], input[1])
input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (x2, y2) = (input[0], input[1])
input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (x3, y3) = (input[0], input[1])

var (x4, y4) = (0, 0)

// x4구하는 부분
if x1 == x2 {
    x4 = x3
}
else if x1 == x3 {
    x4 = x2
}
else if x2 == x3 {
    x4 = x1
}
// y4구하는 부분
if y1 == y2 {
    y4 = y3
}
else if y1 == y3 {
    y4 = y2
}
else if y2 == y3 {
    y4 = y1
}

print(x4, y4)

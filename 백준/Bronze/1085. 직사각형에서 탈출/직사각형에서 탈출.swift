// 백준 - 1085번
let input = readLine()!.split(separator: " ").map{Int($0)!}
let x: Int = input[0]
let y: Int = input[1]
let w: Int = input[2]
let h: Int = input[3]

var xLeft: Int = 0
var xRight: Int = 0
var yUp: Int = 0
var yDown: Int = 0

xLeft = x
xRight = w - x
yUp = h - y
yDown = y

print(min(xLeft, xRight, yUp, yDown))


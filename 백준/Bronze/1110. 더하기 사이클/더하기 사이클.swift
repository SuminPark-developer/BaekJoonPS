// 백준 - 1110번(2 - repeat while 사용)
let N = Int(readLine()!)!
var newNum: Int = N
var A: Int
var B: Int
var length: Int = 0

repeat {
    A = newNum / 10
    B = newNum % 10
    
    newNum = (B * 10) + ((A + B) % 10)
    
    length += 1
    
} while N != newNum

print(length)

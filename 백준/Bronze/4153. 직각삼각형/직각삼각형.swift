// 백준 - 4153번
while true {
    var input = readLine()!.split(separator: " ").map{Int($0)!}
    input.sort()
    let a: Int = input[0]
    let b: Int = input[1]
    let c: Int = input[2]
    
    
    if a == 0 && b == 0 && c == 0 {
        break
    }
    
    if (c * c) == (a * a) + (b * b) {
        print("right")
    }
    else {
        print("wrong")
    }
    
}

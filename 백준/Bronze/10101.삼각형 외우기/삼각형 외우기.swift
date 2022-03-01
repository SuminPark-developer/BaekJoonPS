// MARK: - 10101번
var angle: [Int] = []
var sum = 0

for _ in 0..<3 {
    angle.append(Int(readLine()!)!)
}

//sum = angle.reduce(0) { (num1: Int, num2: Int) -> Int in
//    return num1 + num2
//}
sum = angle.reduce(0, +)

if sum != 180 {
    print("Error")
}
else {
    let temp = angle.filter{$0 == 60}.count
    if temp == 3 {
        print("Equilateral")
    }
    else {
        if (angle[0] == angle[1]) || (angle[0] == angle[2]) || (angle[1] == angle[2]){
            print("Isosceles")
        }
        else {
            print("Scalene")
        }
    }
}

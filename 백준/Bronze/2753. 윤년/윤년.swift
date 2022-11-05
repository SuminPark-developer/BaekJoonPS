// 백준 - 2753번
let year = Int(readLine()!)!

if (year % 4 == 0) && (year % 100 != 0) {
    print("1") // 유년
}
else if year % 400 == 0 {
    print("1") // 윤년
}
else {
    print("0") // 평년
}

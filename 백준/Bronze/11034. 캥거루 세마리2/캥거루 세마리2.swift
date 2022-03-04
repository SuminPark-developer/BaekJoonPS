while let input = readLine() {
    
    let numArray = input.split(separator: " ").map{Int(String($0))!}
    
    let (A, B, C) = (numArray[0], numArray[1], numArray[2])
    var count: Int = 0
    
    if B - A > C - B { // 오른쪽에서 왼쪽으로 점프 시,
        count = B - A - 1
    }
    else if B - A <= C - B { // 왼쪽에서 오른쪽으로 점프 시,
        count = C - B - 1
    }

    print(count)
    
}

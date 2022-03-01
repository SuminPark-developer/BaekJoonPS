// MARK: - 10768번
let month = Int(readLine()!)!
let day = Int(readLine()!)!

if month < 2 {
    print("Before")
}
else if month >= 3 {
    print("After")
}
else { // 2월일 때,
    if day < 18 {
        print("Before")
    }
    else if day == 18 {
        print("Special")
    }
    else {
        print("After")
    }
}

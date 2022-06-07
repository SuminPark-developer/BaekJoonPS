// MARK: - 10988번
let arr = readLine()!.map{String($0)}
let length: Int = arr.count
var check: Bool = true

for i in 0..<length/2 {
    if arr[i] == arr[length - 1 - i] {
        continue
    }
    else {
        check = false
        break
    }
}

if check {
    print(1)
}
else {
    print(0)
}

// MARK: - 1212번 ( 참고 : https://www.acmicpc.net/source/31035491)
let N = readLine()!.map{Int(String($0))!}
var result = ""

let arr = ["000", "001", "010", "011", "100", "101", "110", "111"]

for num in N {
    result += arr[num]
}

while result.first == "0" {
    result.removeFirst()
}

if result.isEmpty {
    result = "0"
    print(result)
}
else {
    print(result)
}

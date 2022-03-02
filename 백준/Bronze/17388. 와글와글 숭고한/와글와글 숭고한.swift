// MARK: - 17388번
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let sum = input.reduce(0, +)

if sum >= 100 {
    print("OK")
}
else {
    let index = input.firstIndex(of: input.min()!)
    switch index {
    case 0:
        print("Soongsil")
    case 1:
        print("Korea")
    case 2:
        print("Hanyang")
    default:
        print("default 없음.")
    }
}

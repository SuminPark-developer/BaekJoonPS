// MARK: - 16431번
let bessie = readLine()!.split(separator: " ").map{Int(String($0))!}
var (bessieX, bessieY) = (bessie[0], bessie[1])
let daisy = readLine()!.split(separator: " ").map{Int(String($0))!}
var (daisyX, daisyY) = (daisy[0], daisy[1])
let john = readLine()!.split(separator: " ").map{Int(String($0))!}
var (johnX, johnY) = (john[0], john[1])

var countBessie: Int = max(abs(johnX - bessieX), abs(johnY - bessieY))
var countDaisy: Int = abs(johnX - daisyX) + abs(johnY - daisyY)

if countBessie > countDaisy {
    print("daisy")
}
else if countBessie < countDaisy {
    print("bessie")
}
else {
    print("tie")
}

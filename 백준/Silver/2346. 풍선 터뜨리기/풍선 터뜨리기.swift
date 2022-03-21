// 백준 - 2346번
class Ballon {
    var index: Int
    var value: Int

    init(_ index: Int, _ value: Int) {
        self.index = index
        self.value = value
    }

}

let N = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = [Ballon]()

for i in 0..<N {
    arr.append(Ballon(i + 1, input[i]))
}

var result = [Int]()
var position = 0

while arr.count > 0 {
    result.append(arr[position].index)
    var next: Int = position + arr[position].value + (arr[position].value > 0 ? -1 : 0)
    arr.remove(at: position)

    if arr.count == 0 {
        break
    }

    next %= arr.count

    if next < 0 {
        next += arr.count
    }

    position = next

}

for i in result {
    print(i, terminator: " ")
}

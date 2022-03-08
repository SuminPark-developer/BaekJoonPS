// 백준 - 1436번
let N = Int(readLine()!)!
var num: Int = 665
var count: Int = 0

while true {
    var split: [Int] = []
    var temp: Int = num
    
    while temp > 0 {
        split.append(temp % 10)
        temp /= 10
    }
    
//    for i in split {
//        print(i, terminator: " ")
//    }
    
    for i in 0...(split.count-3) {
        if split[i] == 6 {
            if split[i + 1] == 6 {
                if split[i + 2] == 6 {
                    count += 1
                    break
                }
            }
        }
    }
    
//    print("count : \(count)")
    if count == N {
        break
    }

    num += 1
    
}

print(num)

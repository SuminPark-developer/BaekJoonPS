// MARK: - 10174번
let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.map{String($0).lowercased()}
    let length: Int = input.count
    var flag: Bool = true
    
    for i in 0..<length/2 {
        if input[i] == input[length - 1 - i] {
            continue
        }
        else {
            flag = false
            break
        }
    }
    
    if flag {
       print("Yes")
    }
    else {
        print("No")
    }
}

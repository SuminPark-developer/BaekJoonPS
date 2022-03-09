// 백준 - 9012번
let T = Int(readLine()!)!

func stack(_ input: String) -> Bool {
    var temp = [Character]()
    
    for i in input {
        if i == "(" {
            temp.append(i)
        }
        else { // i == ")"
            if temp.isEmpty == true {
                return false
            }
            else {
                if temp.popLast() != "(" {
                    return false
                }
            }
        }
    }
    
    return temp.isEmpty
    
}

for _ in 0..<T {
    if stack(readLine()!) == true {
        print("YES")
    }
    else {
        print("NO")
    }
}

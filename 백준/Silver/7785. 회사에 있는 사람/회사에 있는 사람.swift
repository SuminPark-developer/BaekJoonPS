// 백준 - 7785번(Set 활용)
let N = Int(readLine()!)!
var array: Set<String> = []

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{String($0)}
    let name: String = input[0]
    let work: String = input[1]
    
    if work == "enter" {
        array.insert(name)
    }
    else { // work == "leave"
        array.remove(name)
    }
    
}

let temp = array.sorted(by: >)
for i in temp {
    print(i)
}

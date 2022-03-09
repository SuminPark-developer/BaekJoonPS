// MARK: - 1264번
while true {
    let input = readLine()!
    if input == "#" {
        break
    }
    
    let str = input.lowercased().map{String($0)}
    
    let count = str.filter{$0 == "a" || $0 == "e" || $0 == "i" || $0 == "o" || $0 == "u"}.count
    print(count)
}

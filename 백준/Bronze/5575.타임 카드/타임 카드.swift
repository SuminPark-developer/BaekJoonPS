// MARK: - 5575번
for _ in 0..<3 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    let startTime = (input[0] * 3600) + (input[1] * 60) + input[2]
    let endTime = (input[3] * 3600) + (input[4] * 60) + input[5]
    
    let workTime = endTime - startTime
    
    let hour = workTime / 3600
    let minute = (workTime % 3600) / 60
    let sec = (workTime % 3600) % 60
    
    print("\(hour) \(minute) \(sec)")
    
}

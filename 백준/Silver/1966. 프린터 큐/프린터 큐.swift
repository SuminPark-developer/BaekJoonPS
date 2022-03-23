// 백준 - 1966번
let T = Int(readLine()!)!

for _ in 0..<T {
    var input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (N, M) = (input[0], input[1])
    
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var queue: [[Int]] = [[Int]]()
    
    for i in 0..<N {
        queue.append([i, input[i]])
    }
    
    let priority = input.sorted(by: >)
    var priorityIndex = 0
    var priorityMax = priority[priorityIndex]
    var count: Int = 0
    
    while true {
        if queue.first![1] == priorityMax {
            if queue.first![0] == M {
                count += 1
                print(count)
                break
            }
            else {
                queue.removeFirst()
                priorityIndex += 1
                priorityMax = priority[priorityIndex]
                count += 1
            }
        }
        else {
            queue.append(queue.removeFirst())
        }
        
    }
    
}

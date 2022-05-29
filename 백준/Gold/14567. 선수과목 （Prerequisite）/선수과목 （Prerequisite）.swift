// MARK: - 14567번(위상정렬 - 큐)
class Dequeue<T> {
    var enQueue: [T]
    var deQueue: [T] = []

    var count: Int {
        return enQueue.count + deQueue.count
    }

    var isEmpty: Bool {
        return enQueue.isEmpty && deQueue.isEmpty
    }

    init(_ queue: [T]) {
        enQueue = queue
    }

    func pushLast(_ element: T) {
        enQueue.append(element)
    }

    func pushFirst(_ element: T) {
        deQueue.append(element)
    }

    func popLast() -> T {
        if enQueue.isEmpty {
            enQueue = deQueue.reversed()
            deQueue.removeAll()
        }
        return enQueue.popLast()!
    }

    func popFirst() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
var indegree =  Array(repeating: 0, count: N + 1) // 진입차수
var graph: [[Int]] = Array(repeating: [], count: N + 1) // 노드i에서 이동가능한 노드들 모음.
var answerArray: [Int] = Array(repeating: 1, count: N + 1) // 학기 저장 배열.

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (from, to) = (input[0], input[1])
    graph[from].append(to)
    indegree[to] += 1 // 진입차수 저장.
}

let q: Dequeue<Int> = Dequeue([])
for i in 1...N {
    if indegree[i] == 0 { // 진입차수가 0인 것들만 큐에 넣음.
        q.pushLast(i)
    }
}

while !q.isEmpty { // 큐가 빌 때까지,
    let node: Int = q.popFirst()

    for nextNode in graph[node] {
        answerArray[nextNode] = answerArray[node] + 1 // 현재노드의 다음학기 수강.
        indegree[nextNode] -= 1 // 진입차수 감소.

        if indegree[nextNode] == 0 { // 만약 진입차수가 0이면, 큐에 넣음.
            q.pushLast(nextNode)
        }
    }
}

print(answerArray[1...N].map{String($0)}.joined(separator: " "))

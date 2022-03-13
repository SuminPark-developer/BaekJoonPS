// MARK: - 11279번
struct MaxHeap<T: Comparable> {
    var heap: [T] = []

    var isEmpty: Bool {
        heap.count <= 1 ? true : false
    }

    init() {}
    init(_ element: T) {
        heap.append(element)
        heap.append(element)
    }
    
    mutating func insert(_ element: T) {
        if heap.isEmpty {
            heap.append(element)
            heap.append(element)
            return
        }
        heap.append(element)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 { // rootNode
                return false
            }
            let parentIndex = insertIndex / 2
            return heap[insertIndex] > heap[parentIndex] ? true : false
        }
        
        var insertIndex: Int = heap.count - 1
        while isMoveUp(insertIndex) {
            let parentIndex = insertIndex / 2
            heap.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus {case left, right, none}
    
    mutating func pop() -> T? {
        if heap.count <= 1 {
            return nil
        }
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = poppedIndex * 2
            let rightChildIndex = leftChildIndex + 1
            
            if leftChildIndex >= heap.count { // 자식 노드가 없을 경우,
                return .none
            }
            
            if rightChildIndex >= heap.count { // 왼쪽자식 노드만 있을 경우,
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
            }
            
            if (heap[poppedIndex] > heap[leftChildIndex]) && (heap[poppedIndex] > heap[rightChildIndex]) { // 자식노드들보다 모두 클 경우,
                return .none
            }
            
            if (heap[poppedIndex] < heap[leftChildIndex]) && (heap[poppedIndex] < heap[rightChildIndex]) { // 자식노드들이 다 큰 경우,
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            // 둘 중 하나의 자식만 큰 경우,
            return heap[leftChildIndex] > heap[poppedIndex] ? .left : .right
        }
        
        var poppedIndex = 1
        while true {
            switch moveDown(poppedIndex) {
            case .none:
                return returnData
            case .left:
                let leftChildIndex = poppedIndex * 2
                heap.swapAt(leftChildIndex, poppedIndex)
                poppedIndex = leftChildIndex
            case .right:
                let rightChildIndex = poppedIndex * 2 + 1
                heap.swapAt(rightChildIndex, poppedIndex)
                poppedIndex = rightChildIndex
            }
        }
        
    }
    
}

let N = Int(readLine()!)!
var myMaxHeap: MaxHeap<Int> = MaxHeap()

for _ in 0..<N {
    let input = Int(readLine()!)!

    if input == 0 {
        let answer = myMaxHeap.pop()
        answer == nil ? print("0") : print(answer!)
    }
    else {
        myMaxHeap.insert(input)
    }
}

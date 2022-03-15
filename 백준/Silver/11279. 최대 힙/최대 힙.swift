// MARK: - 11279번(최대 힙)
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
            
            // case1. 모든(왼쪽) 자식 노드가 없는 경우, (완전이진트리는 왼쪽부터 채워지므로)
            if leftChildIndex >= heap.count {
                return .none
            }
            
            // case2. 왼쪽 자식 노드만 있는 경우,
            if rightChildIndex >= heap.count {
                return heap[leftChildIndex] > heap[poppedIndex] ? .left : .none
            }
            
            // case3. 왼쪽&오른쪽 자식 노드 모두 있는 경우
            // case3-1. 자식들보다 자신이 모두 큰 경우(자신이 제일 큰 경우)
            if (heap[poppedIndex] > heap[leftChildIndex]) && (heap[poppedIndex] > heap[rightChildIndex]) {
                return .none
            }
            
            // case3-2. 자식들이 자신보다 모두 큰 경우(왼쪽과 오른쪽 자식 중, 더 큰 자식을 선별)
            if (heap[poppedIndex] < heap[leftChildIndex]) && (heap[poppedIndex] < heap[rightChildIndex]) {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            
            // case3-3. 왼쪽과 오른쪽 자식 중, 한 자식만 자신보다 큰 경우, (= 둘 중 하나의 자식만 큰 경우)
            if (heap[leftChildIndex] > heap[poppedIndex]) || (heap[rightChildIndex] > heap[poppedIndex]) {
                return heap[leftChildIndex] > heap[rightChildIndex] ? .left : .right
            }
            return .none
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

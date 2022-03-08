// MARK: - 2503번
let N = Int(readLine()!)!

func permute(_ nums: [String], _ targetNum: Int) -> [[String]] {
    var results = [[String]]()
    var visited = Array(repeating: false, count: nums.count)
    
    func permutation(_ nowPermute: [String]) {
        if nowPermute.count == targetNum {
            results.append(nowPermute)
            return
        }
        for i in 0..<nums.count {
            if visited[i] == false {
                visited[i] = true
                permutation(nowPermute + [nums[i]])
                visited[i] = false
            }
        }
    }
    permutation([])
    return results
}

var nums = permute(["1", "2", "3", "4", "5", "6", "7", "8", "9"], 3)
var deleteNums: [[String]] = []
//nums.remove(at: nums.firstIndex(of: ["1", "2", "3"])!)

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (num, strike, ball) = (String(input[0]).map{String($0)}, input[1], input[2])

    for i in 0..<nums.count {
        var strikeCount: Int = 0
        var ballCount: Int = 0

        for j in 0..<3 {
            if nums[i][j] == num[j] {
                strikeCount += 1
            }
            else if nums[i].contains(num[j]) {
                ballCount += 1
            }
        }

        if (strike != strikeCount) || (ball != ballCount) {
            deleteNums.append(nums[i])
        }
        
    }

}

deleteNums = Array(Set(deleteNums)) // 지울 배열들의 중복 제거

for delete in deleteNums {
    nums.remove(at: nums.firstIndex(of: delete)!)
}

print(nums.count)

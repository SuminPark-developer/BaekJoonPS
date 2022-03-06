// 백준 - 5585번
var N = Int(readLine()!)!
var count500: Int = 0
var count100: Int = 0
var count50: Int = 0
var count10: Int = 0
var count5: Int = 0
var count1: Int = 0

N = 1000 - N

count500 = N / 500
N = N % 500

count100 = N / 100
N = N % 100

count50 = N / 50
N = N % 50

count10 = N / 10
N = N % 10

count5 = N / 5
N = N % 5

count1 = N / 1

print(count500 + count100 + count50 + count10 + count5 + count1)

// 백준 - 1789번( 참고 - https://blog.naver.com/PostView.nhn?blogId=tksrl0379&logNo=221999934175)
let S = Int(readLine()!)!
var num: Int = 0
var sum: Int = 0

while S > num + sum {
    num += 1
    
    sum += num
    
}

print(num)

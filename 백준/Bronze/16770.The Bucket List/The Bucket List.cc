#include <iostream>
#include <string>
#include<queue>
#include <vector>
#include <algorithm>
#include<cmath>
using namespace std;
 
int N;
int MaxB;
int visited[1001][1001];
int Bucket[1001];
 
int main() {
    ios_base::sync_with_stdio(0);
    cin.tie(0);
 
    cin >> N;
 
    for (int i = 1; i <= N; i++) {
        int a, b, val;
        cin >> a >> b >> val;
        Bucket[a] += val;
        Bucket[b] -= val;
    }
    
    int ans = 0, cnt = 0;
    for (int i = 0; i <= 1000; i++) {
        cnt += Bucket[i];
        ans = max(ans, cnt);
    }
    cout << ans;
 
 
    return 0;
}

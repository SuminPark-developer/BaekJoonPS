#include <iostream>
#include <cstring>
#include <vector>
#include <queue>
#define MAX 1001
using namespace std;

char map[MAX][MAX];
int fire[MAX][MAX]; // 불의 확산 체크
int visit[MAX][MAX]; // 상근이의 이동 체크
int dx[4] = {1, 0, -1, 0};
int dy[4] = {0, -1, 0, 1};
vector<pair<int, int> > f, s; // 초기의 불과 상근이 위치 저장
int w, h;

// 불의 확산 BFS
void fire_moving() {
    queue<pair<int, int> > q;
    for(int i = 0; i < f.size(); i++) {
        q.push(f[i]);
    }
    
    while(!q.empty()) {
        int x = q.front().first;
        int y = q.front().second;
        q.pop();
        for(int i = 0; i < 4; i++) {
            int fx = x + dx[i];
            int fy = y + dy[i];
            // map의 범위를 벗어나는 경우
            if(fx < 0 || fx >= h || fy < 0 || fy >= w) continue;
            // 불이 이미 확산되었거나 다음 위치가 #인 경우
            if(fire[fx][fy] != -1 || map[fx][fy] == '#') continue;
            q.push({fx, fy});
            fire[fx][fy] = fire[x][y] + 1;
        }
    }
}

// 상근이의 이동 BFS
void sangeun_moving() {
    queue<pair<int, int> > q;
    q.push(s[0]);
    
    while(!q.empty()) {
        int x = q.front().first;
        int y = q.front().second;
        q.pop();
        for(int i = 0; i < 4; i++) {
            int sx = x + dx[i];
            int sy = y + dy[i];
            // 범위를 벗어나면 탈출이므로 종료
            if(sx < 0 || sx >= h || sy <0 || sy >= w) {
                cout<<visit[x][y] + 1<<"\n";
                return;
            }
            // 이미 상근이가 이동한 위치이거나 #을 만난 경우
            if(visit[sx][sy] != -1 || map[sx][sy] == '#') continue;
            // 불이 이미 확산되었는데 상근이가 이동하기 전에 확산된 경우
            // (불이 확산 되었더라도 상근이가 이동한 후 확산 되었다면 상관이 없다!)
            if(fire[sx][sy] != -1 && fire[sx][sy] <= visit[x][y] + 1) continue;
            q.push({sx, sy});
            visit[sx][sy] = visit[x][y] + 1;
        }
    }
    cout<<"IMPOSSIBLE\n";
}

int main(void) {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
    int T;
    cin>>T;
    
    while(T--) {
        cin>>w>>h;
        // 체크 배열, 벡터 메모리 초기화
        memset(fire, -1, sizeof(fire));
        memset(visit, -1, sizeof(visit));
        f.clear();
        s.clear();
        
        for(int i = 0; i < h; i++) {
            for(int j = 0; j < w; j++) {
                cin>>map[i][j];
                if(map[i][j] == '*') {
                    f.push_back({i, j});
                    fire[i][j] = 0;
                } else if(map[i][j] == '@') {
                    s.push_back({i, j});
                    visit[i][j] = 0;
                }
            }
        }
        
        // BFS : 불의 확산 -> 상근이의 이동
        fire_moving();
        sangeun_moving();
    }
}
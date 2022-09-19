from collections import deque
import copy
from itertools import combinations
import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 17142번 연구소3
# 시간제한 1초
n,m = map(int,sys.stdin.readline().split())
num_restrict(n,4,50)    # 4 <= n <= 50
num_restrict(m,1,10)    # 1 <= m <= 10
maze = []
viruses = []
for i in range(n):
    arr = list(sys.stdin.readline().split())
    for j in range(n):
        if arr[j] == '2': viruses.append([i,j])
    maze.append(arr)

queue = deque()
move_x = [-1,1,0,0]
move_y = [0,0,-1,1]
result = float('inf')
for combis in combinations(viruses,m):
    k = 0
    stopper = 0
    miro = copy.deepcopy(maze)
    visited = [[False] * n for _ in range(n)]
    for combi in combis:
        a = combi[0] 
        b = combi[1]
        miro[a][b] = 0
        visited[a][b] = True
        queue.append(combi)
    # print(combis)
    while queue:
        x,y = queue.popleft()
        for i in range(4):
            dx = x + move_x[i]
            dy = y + move_y[i]
            if 0<=dx<n and 0<=dy<n:
                if not visited[dx][dy]:
                    if maze[dx][dy] != '1':
                        miro[dx][dy] = miro[x][y]+1
                        if maze[dx][dy] == '2': pass
                        else: k = max(k,miro[dx][dy])
                        visited[dx][dy] = True
                        queue.append([dx,dy])             
    for combi in combis:
        miro[combi[0]][combi[1]] = '*'
    for m in miro:
        if '0' in m: stopper = 1
    if stopper == 0 and k>=0:
        result = min(result,k)

if result != float('inf'): print(result)
else: print(-1)

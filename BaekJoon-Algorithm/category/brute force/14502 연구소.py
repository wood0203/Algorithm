import sys
from collections import deque
from itertools import combinations
import time

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

start = time.time()
n,m = map(int,sys.stdin.readline().split())
miro = []
zeros = []
two = []
queue = deque()
for i in range(n):
    arr = list(map(int,sys.stdin.readline().split()))
    for j in range(len(arr)):
        if arr[j] == 2: two.append([i,j])
        if arr[j] == 0: zeros.append([i,j])
    miro.append(arr)
combis = list(combinations(zeros, 3))
move_x = [1,-1,0,0]
move_y = [0,0,1,-1]
answer = -1
for combi in combis:
    visited = [[0 for _ in range(m)] for _ in range(n)]
    for t in two:
        queue.append(t)
        
    for idx in combi:
        a = idx[0]
        b = idx[1]
        miro[a][b] = 1
    
    while queue:
        x, y = queue.popleft()
        for i in range(4):
            dx = x + move_x[i]
            dy = y + move_y[i]
            if 0<=dx<n and 0<=dy<m:
                if miro[dx][dy] == 0:
                    if visited[dx][dy] == 0:
                        queue.append([dx,dy])
                        visited[dx][dy] = 1
    result = 0
    for i in range(n):
        for j in range(m):
            if miro[i][j] == 0 and visited[i][j] == 0: result += 1
    answer = max(result,answer)
    
    for idx in combi:
        a = idx[0]
        b = idx[1]
        miro[a][b] = 0

print(answer)
# print(time.time() - start)
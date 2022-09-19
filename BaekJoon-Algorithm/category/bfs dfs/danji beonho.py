from collections import deque
import sys

n = int(input())
if 5 <= n <= 25:
    pass
else:
    sys.exit()

aparts = []
for _ in range(n):
    aparts.append(list(input()))

go_i = [-1, 1, 0, 0]
go_j = [0, 0, -1, 1]


visited = [[False] * n for _ in range(n)]
house_num = []


def bfs(i, j):
    queue = deque()
    queue.append([i, j])
    visited[i][j] = True
    cnt = 1
    while queue:
        i, j = queue.popleft()
        stopper = 0
        while stopper < 4:
            di = i + go_i[stopper]
            dj = j + go_j[stopper]
            stopper += 1
            if di < 0 or di >= n or dj < 0 or dj >= n:
                continue
            if not visited[di][dj] and aparts[di][dj] == '1':
                cnt += 1
                visited[di][dj] = True
                queue.append([di, dj])

    house_num.append(cnt)


for i in range(n):
    for j in range(n):
        if aparts[i][j] == '1' and not visited[i][j]:
            bfs(i, j)
            
house_num.sort()
print(len(house_num))
for i in range(len(house_num)):
    print(house_num[i])

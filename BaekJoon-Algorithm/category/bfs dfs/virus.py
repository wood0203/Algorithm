from collections import deque
import sys

n = int(input())
if n <= 100: pass
else: sys.exit()

graph = [[]]
for _ in range(n):
    graph.append([0] * (n+1))

num = int(input())
for _ in range(num):
    x,y = map(int,input().split())
    graph[x][y] = graph[y][x] = 1

visited = [False] * (n+1)


def virus_bfs(graph):
    queue = deque([1])
    while queue:
        t = queue.popleft()
        for idx, i in enumerate(graph[t]):
            if i == 1 and not visited[idx]:
                visited[idx] = True
                queue.append(idx)

virus_bfs(graph)

result = 0
for i in range(2,len(visited)):
    if visited[i]:
        result += 1
print(result)
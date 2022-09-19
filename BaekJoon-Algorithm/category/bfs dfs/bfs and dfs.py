from collections import deque


def dfs(v):
    visited[v] = True
    print(v, end=' ')
    for i in range(1, n+1):
        if visited[i] == False and graph[v][i] == 1:
           dfs(i)


n,m,v = map(int,input().split())
graph = [[0]*(n+1) for i in range(n+1)]         # 1부터 표현하기위해 한칸 더 추가시킴.
for i in range(m):
    a,b = map(int,input().split())
    graph[a][b] = graph[b][a] = 1
visited = [False] * (n+1)
def bfs(v):
    queue = deque([v])
    visited[v] = True
    while queue:
        v = queue.popleft()
        print(v,end=' ')
        for i in range(1,n+1):
            if visited[i] == False and graph[v][i] == 1:
                queue.append(i)
                visited[i] = True


dfs(v)
visited = [False] * (n+1)
print()
bfs(v)

# 인접행렬 방식
# 처음에 내가 시도했던 graph화를
# 이중리스트로 각 정점의 연결 여부(0,1)로 표현함.
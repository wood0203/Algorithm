import sys
from itertools import combinations

# 백준
# 15686번 치킨 배달
# 시간제한 1초

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

n,m = map(int,input().split())
num_restrict(n,2,50)
num_restrict(m,1,13)
homes = []
chickens = []
for i in range(n):
    row = list(map(int,sys.stdin.readline().split()))
    for j in range(n):
        if row[j] == 1:
            homes.append((i+1,j+1))
        if row[j] == 2:
            chickens.append((i+1,j+1))
# print(chickens)
# print(homes)

minv = float('inf')
for combi in combinations(chickens,m):
    sumv = 0
    for home in homes:
        sumv += min([abs(home[0] - i[0])+abs(home[1]-i[1]) for i in combi])
        # 이 문제의 핵심 풀이 부분.
        if minv <= sumv: break
        # 이전의 치킨 거리보다 새로 만든 sumv 값이 작으면 탈출.
    if sum < minv: minv = sumv
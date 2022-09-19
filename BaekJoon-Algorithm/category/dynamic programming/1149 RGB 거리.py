import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 1149번 RGB거리
# 다이나믹 프로그래밍
# 시간제한 2초

n = int(input())
num_restrict(n,2,1000)
d = [[0 for _ in range(3)] for j in range(n)]


def dn_prog(lst,i):
    for j in range(3):
        for k in range(3):
            if j == k:
                continue
            else:
                temp = d[i-1][j] + lst[i][k]
                if d[i][k] == 0:
                    d[i][k] = temp
                else:
                    if temp <= d[i][k]:
                        d[i][k] = temp




costs = []
for i in range(n):
    cost_lst = list(map(int,sys.stdin.readline().split()))
    costs.append(cost_lst)
    if i == 0: d[0] = cost_lst
    else: dn_prog(costs,i)

# print(d)
# print(costs)
print(min(d[n-1]))
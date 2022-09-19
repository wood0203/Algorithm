import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 1932번 정수 삼각형
# 다이나믹 프로그래밍
# 시간제한 2초

n = int(input())
num_restrict(n,1,500)
d = [[0 for _ in range(j+1)] for j in range(n)]


def dn_prog(lst,pyr):
    for i in range(len(lst)-1):
        for j in range(i,i+2):
            temp = d[len(lst)-2][i] + pyr[len(lst)-1][j]
            if d[len(lst)-1][j] == 0:
                d[len(lst)-1][j] = temp
            else:
                if temp > d[len(lst)-1][j]:
                    d[len(lst)-1][j] = temp


pyramid = []
for i in range(n):
    if i == 0:
        num = int(input())
        pyramid.append([num])
        d[0][0] = num
    else:
        arr = list(map(int,sys.stdin.readline().split()))
        pyramid.append(arr)
        dn_prog(arr,pyramid)

print(max(d[n-1]))
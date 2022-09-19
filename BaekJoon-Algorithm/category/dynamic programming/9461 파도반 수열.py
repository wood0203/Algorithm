import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 9461번 파도반 수열
# 다이나믹 프로그래밍
# 시간제한 1초

t = int(input())
d = [-1 for _ in range(101)]
for i in range(1,4):
    d[i] = 1
d[0] = 0
d[4] = 2


def p(x):
    if d[x] != -1:
        return d[x]
    else:
        d[x] = p(x-5) + p(x-1)
        return d[x]


for _ in range(t):
    n = int(input())
    num_restrict(n, 1, 100)
    print((p(n)))
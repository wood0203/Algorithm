import sys


def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 1003번 피보나치 함수
# 다이나믹 프로그래밍
# 시간제한 0.25초
# 보텀업 방식 사용.

t = int(input())
d = [[0,0] for _ in range(41)]
d[0][0] = z
d[1][1] = 1

for i in range(2,41):
    if d[i][0] == 0:
        d[i][0] = d[i-1][0] + d[i-2][0]
        d[i][1] = d[i-1][1] + d[i-2][1]

for _ in range(t):
    n = int(input())
    num_restrict(n,0,40)
    print(d[n][0], d[n][1])
    
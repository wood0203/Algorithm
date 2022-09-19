import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 1904번 01타일
# 다이나믹 프로그래밍
# 시간제한 0.75초

n = int(input())
num_restrict(n,1,1000000)
d = [0 for _ in range(1000001)]
d[1] = 1
d[2] = 2


for i in range(3,1000001):
    d[i] = (d[i-1] + d[i-2]) % 15746

print(d[n])
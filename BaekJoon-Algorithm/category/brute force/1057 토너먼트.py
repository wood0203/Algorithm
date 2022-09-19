import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()


# 백준
# 브루트포스 알고리즘
# 2501 약수 구하기
# 경우의 수를 다 따져보고 규칙을 찾아냄.
# 시간제한 1초

n, a, b = map(int,input().split())
num_restrict(n,2,100000) # 2 <= n <= 100,000
a, b = a-1, b-1
i = 1
while True:
    if a // 2 == b // 2:
        print(i)
        break
    a, b = a // 2, b // 2
    i += 1
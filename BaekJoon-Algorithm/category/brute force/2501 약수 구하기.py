import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()


# 백준
# 브루트포스 알고리즘
# 2501 약수 구하기
# 시간제한 1초

n, k = map(int,input().split())
num_restrict(n,1,10000)
num_restrict(k,1,n)
lst = []
i = 1
while i <= n:
    if n%i == 0:
        lst.append(i)
    i += 1
if len(lst) < k:
    print(0)
else:
    print(lst[k-1])
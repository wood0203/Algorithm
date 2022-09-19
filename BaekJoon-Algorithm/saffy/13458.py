# SAFFY 기출
# 백준 13458번 문제

import sys

n = int(input())                        # 시험장의 개수
a = list(map(int,input().split()))      # 응시자 수
b,c = map(int,input().split())          # 총감독관 / 부감독 감시 수
if 1 <= n <= 1000000 and len(a) == n and 1 <= b <= 1000000 and 1 <= c <= 1000000: pass
else: sys.exit()

cnt = n
for i in range(n):
    a[i] -= b
    if a[i] > 0:
        cnt += (a[i] // c)
        if a[i] % c != 0:
            cnt += 1

print(cnt)
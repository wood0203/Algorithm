import sys

n,m=map(int,sys.stdin.readline().split())
if 3 <= n <= 100 and 10 <= m <= 300000: pass
else: sys.exit()

card_num = list(map(int,input().split()))
if max(card_num) <= 100000 and len(card_num) == n: pass
else: sys.exit()

diff = set([]) # 차이 집합
for i in range(len(card_num)-2):
    for j in range(i+1,len(card_num)-1):
        for k in range(j+1,len(card_num)):
            temp = card_num[i] + card_num[j] + card_num[k]
            if temp > m: pass
            else: diff.add(abs(m - temp))

print(m - min(diff))
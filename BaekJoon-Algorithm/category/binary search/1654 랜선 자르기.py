import sys

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 카테고리별 문제 - 이분탐색
# 1654번 랜선 자르기
# 시간제한 2초

k, n = map(int,input().split())
num_restrict(k,1,10000) # 1 <= n <= 10,000
num_restrict(n,1,1000000) # 1 <= m <= 1,000,000
lines = []
for _ in range(k):
    lines.append(int(input()))
lines.sort()

start = 0
end = max(lines)        # 시간 최대 10000
maximum = 0
while start <= end:
    cnt = 0
    mid = (start + end) // 2
    for line in lines:
        if mid == 0:
            cnt = n
        elif line >= mid:
            cnt += ((line - mid) // mid) + 1
    if cnt < n:
        end = mid - 1
    else:
        if mid > maximum:
            maximum = mid
        start = mid + 1

print(maximum)
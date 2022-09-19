import sys


def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 2805번 나무 자르기
# 이분 탐색
# 시간제한 1초

n, m = map(int,input().split())
num_restrict(n,1,1000000) # 1 <= n <= 1000000
num_restrict(m,1,2000000000) # 1 <= m <= 2000000000
trees = sorted(list(map(int,sys.stdin.readline().split())))

start = 0
end = max(trees)
result = 0
while start <= end:
    sum = 0
    mid = (start + end) // 2
    for tree in trees:
        if tree > mid:
            sum += (tree-mid)
    if sum < m:
        end = mid - 1
    else:
        if mid > result: result = mid
        start = mid + 1
print(result)
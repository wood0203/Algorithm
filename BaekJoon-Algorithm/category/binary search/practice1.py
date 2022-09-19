import sys
from unittest import result

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 카테고리별 문제
# 이진탐색
# 2110번 공유기 설치
# 참고 문제

n, c = map(int,sys.stdin.readline().split())
homes = []
for _ in range(n):
    homes.append(int(input()))
homes.sort()

def bn_search(arr,start,end):
    while start <= end:
        mid = (start + end)//2
        old = arr[0]
        cnt = 1

        for i in range(1,len(homes)):
            if arr[i] >= old+mid:
                old = arr[i]
                cnt += 1
        
        if cnt >= c:
            global result
            end = mid-1
            result = mid
        else: start = mid+1


start = homes[0]
end = homes[-1] - homes[0]
bn_search(homes,start,end)
print(result)
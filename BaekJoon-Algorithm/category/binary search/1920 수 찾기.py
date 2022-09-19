# 백준
# 카테고리별 문제 - 이분탐색
# 1920번 수 찾기
# 시간제한 1초
# 순차탐색을 사용하면 시간복잡도가 10억이므로
# for 문 + 이진탐색을 사용해서 시간제한을 해결. 16*100,000 = 16,000,00
import sys


def binary_search(arr1,target,start,end):
    while start <= end:
        mid = (start + end) // 2
        if n_lst[mid] == target:
            return 1
        elif n_lst[mid] > target:
            end = mid - 1
        else:
            start = mid + 1
    return 0


# 수의 범위를 제한시켜주는 함수
def num_restrict(x,a,b):
    if x<a or x>b:
        sys.exit()


n = int(input())
num_restrict(n,1,100000) # 1 <= n <= 100,000
n_lst = sorted(list(map(int,sys.stdin.readline().split())))
m = int(input())
num_restrict(n,1,100000) # 1 <= m <= 100,000
m_lst = list(map(int,sys.stdin.readline().split()))

for i in m_lst:
    print(binary_search(n_lst,i,0,len(n_lst)-1))

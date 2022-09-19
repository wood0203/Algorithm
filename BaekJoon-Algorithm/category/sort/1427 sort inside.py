# 백준
# 카테고리별 문제 - 정렬
# 1427번 소트인사이드
import sys


def num_restrict(x):
    if x<0 or x>1000000000:
        sys.exit()


num = int(input())
num_restrict(num)
arr = list(map(int,str(num)))
arr.sort(reverse=True)
for i in arr:
    print(i, end='')
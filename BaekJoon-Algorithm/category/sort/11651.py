# 백준
# 카테고리별 문제 - 정렬
# 11651번 좌표 정렬하기2
import sys


def num_restrict(x,a,b):
    if x<a or x>b:
        sys.exit()


n = int(input())
num_restrict(n,1,100000)
xy_lst = []
for _ in range(n):
    x, y = map(int,input().split())
    num_restrict(x,-100000,100000)
    num_restrict(y,-100000,100000)
    xy_lst.append([x,y])

xy_lst = sorted(xy_lst, key = lambda x: x[0])
xy_lst = sorted(xy_lst, key = lambda x: x[1])

for x,y in xy_lst:
    print(x, y)
# 백준
# 카테고리별 문제 - 정렬
# 18870번 좌표 압축
import sys


def compress(arr):
    lst = sorted(arr)
    lst[0][1] = 0
    for i in range(1,len(lst)):
        if lst[i-1][0] < lst[i][0]:
            lst[i][1] = lst[i-1][1] + 1
        else:
            lst[i][1] = lst[i-1][1]

    for j in x_lst:
        print(j[1], end=' ')


def num_restrict(x,a,b):
    if x<a or x>b:
        sys.exit()


n = int(input())
num_restrict(n,1,1000000)
x_lst = [[x,x] for x in list(map(int,sys.stdin.readline().split()))]
compress(x_lst)
# https://www.acmicpc.net/board/view/79811#comment-130244
# x_lst와 lst의 주소값이 동일하므로 lst의 특정 값을 바꾸면
# x_lst의 특정 값도 같이 바뀐다.
